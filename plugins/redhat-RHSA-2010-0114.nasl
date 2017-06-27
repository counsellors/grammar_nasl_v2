#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Red Hat Security Advisory RHSA-2010:0114. The text 
# itself is copyright (C) Red Hat, Inc.
#

include("compat.inc");

if (description)
{
  script_id(44665);
  script_version ("$Revision: 1.25 $");
  script_cvs_date("$Date: 2017/01/04 15:51:46 $");

  script_cve_id("CVE-2010-0186", "CVE-2010-0188");
  script_bugtraq_id(38195, 38198);
  script_osvdb_id(27723);
  script_xref(name:"RHSA", value:"2010:0114");

  script_name(english:"RHEL 4 / 5 : acroread (RHSA-2010:0114)");
  script_summary(english:"Checks the rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Red Hat host is missing one or more security updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Updated acroread packages that fix two security issues and a bug are
now available for Red Hat Enterprise Linux 4 Extras and Red Hat
Enterprise Linux 5 Supplementary.

This update has been rated as having critical security impact by the
Red Hat Security Response Team.

Adobe Reader allows users to view and print documents in Portable
Document Format (PDF).

This update fixes two vulnerabilities in Adobe Reader. These
vulnerabilities are summarized on the Adobe Security Advisory
APSB10-07 page listed in the References section. A specially crafted
PDF file could cause Adobe Reader to crash or, potentially, execute
arbitrary code as the user running Adobe Reader when opened.
(CVE-2010-0186, CVE-2010-0188)

This update also fixes a bug where, on some systems, attempting to
install or upgrade the acroread packages failed due to a package
dependency issue. (BZ#557506)

All Adobe Reader users should install these updated packages. They
contain Adobe Reader version 9.3.1, which is not vulnerable to these
issues and fixes this bug. All running instances of Adobe Reader must
be restarted for the update to take effect."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://www.redhat.com/security/data/cve/CVE-2010-0186.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://www.redhat.com/security/data/cve/CVE-2010-0188.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.adobe.com/support/security/bulletins/apsb10-07.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://rhn.redhat.com/errata/RHSA-2010-0114.html"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected acroread and / or acroread-plugin packages."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:H/RL:OF/RC:ND");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");
  script_set_attribute(attribute:"exploit_framework_core", value:"true");
  script_set_attribute(attribute:"exploited_by_malware", value:"true");
  script_set_attribute(attribute:"metasploit_name", value:'Adobe Acrobat Bundled LibTIFF Integer Overflow');
  script_set_attribute(attribute:"exploit_framework_metasploit", value:"true");
  script_set_attribute(attribute:"exploit_framework_canvas", value:"true");
  script_set_attribute(attribute:"canvas_package", value:'CANVAS');
  script_cwe_id(94);

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:acroread");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:acroread-plugin");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:redhat:enterprise_linux:4");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:redhat:enterprise_linux:4.8");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:redhat:enterprise_linux:5");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:redhat:enterprise_linux:5.4");

  script_set_attribute(attribute:"patch_publication_date", value:"2010/02/18");
  script_set_attribute(attribute:"plugin_publication_date", value:"2010/02/19");
  script_set_attribute(attribute:"vuln_publication_date", value:"2006/08/02");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2010-2017 Tenable Network Security, Inc.");
  script_family(english:"Red Hat Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/RedHat/release", "Host/RedHat/rpm-list", "Host/cpu");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("misc_func.inc");
include("rpm.inc");

if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
release = get_kb_item("Host/RedHat/release");
if (isnull(release) || "Red Hat" >!< release) audit(AUDIT_OS_NOT, "Red Hat");
os_ver = eregmatch(pattern: "Red Hat Enterprise Linux.*release ([0-9]+(\.[0-9]+)?)", string:release);
if (isnull(os_ver)) audit(AUDIT_UNKNOWN_APP_VER, "Red Hat");
os_ver = os_ver[1];
if (! ereg(pattern:"^(4|5)([^0-9]|$)", string:os_ver)) audit(AUDIT_OS_NOT, "Red Hat 4.x / 5.x", "Red Hat " + os_ver);

if (!get_kb_item("Host/RedHat/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && cpu !~ "^i[3-6]86$" && "s390" >!< cpu) audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Red Hat", cpu);
if (cpu !~ "^i[3-6]86$") audit(AUDIT_ARCH_NOT, "i386", cpu);

yum_updateinfo = get_kb_item("Host/RedHat/yum-updateinfo");
if (!empty_or_null(yum_updateinfo)) 
{
  rhsa = "RHSA-2010:0114";
  yum_report = redhat_generate_yum_updateinfo_report(rhsa:rhsa);
  if (!empty_or_null(yum_report))
  {
    security_report_v4(
      port       : 0,
      severity   : SECURITY_HOLE,
      extra      : yum_report 
    );
    exit(0);
  }
  else
  {
    audit_message = "affected by Red Hat security advisory " + rhsa;
    audit(AUDIT_OS_NOT, audit_message);
  }
}
else
{
  flag = 0;
  if (rpm_check(release:"RHEL4", cpu:"i386", reference:"acroread-9.3.1-1.el4")) flag++;

  if (rpm_check(release:"RHEL4", cpu:"i386", reference:"acroread-plugin-9.3.1-1.el4")) flag++;


  if (rpm_check(release:"RHEL5", cpu:"i386", reference:"acroread-9.3.1-1.el5")) flag++;

  if (rpm_check(release:"RHEL5", cpu:"i386", reference:"acroread-plugin-9.3.1-1.el5")) flag++;


  if (flag)
  {
    security_report_v4(
      port       : 0,
      severity   : SECURITY_HOLE,
      extra      : rpm_report_get() + redhat_report_package_caveat()
    );
    exit(0);
  }
  else
  {
    tested = pkg_tests_get();
    if (tested) audit(AUDIT_PACKAGE_NOT_AFFECTED, tested);
    else audit(AUDIT_PACKAGE_NOT_INSTALLED, "acroread / acroread-plugin");
  }
}