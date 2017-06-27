#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Red Hat Security Advisory RHSA-2005:799. The text 
# itself is copyright (C) Red Hat, Inc.
#

include("compat.inc");

if (description)
{
  script_id(20049);
  script_version ("$Revision: 1.18 $");
  script_cvs_date("$Date: 2016/12/28 18:06:54 $");

  script_cve_id("CVE-2005-2337");
  script_bugtraq_id(14909);
  script_osvdb_id(19610);
  script_xref(name:"RHSA", value:"2005:799");

  script_name(english:"RHEL 2.1 / 3 / 4 : ruby (RHSA-2005:799)");
  script_summary(english:"Checks the rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Red Hat host is missing one or more security updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Updated ruby packages that fix an arbitrary command execution issue
are now available.

This update has been rated as having moderate security impact by the
Red Hat Security Response Team.

[Updated 25 Oct 2005] Errata has been updated to include missing
packages for Red Hat Enterprise Linux 3.

Ruby is an interpreted scripting language for object-oriented
programming.

A bug was found in the way ruby handles eval statements. It is
possible for a malicious script to call eval in such a way that can
allow the bypass of certain safe-level restrictions. The Common
Vulnerabilities and Exposures project (cve.mitre.org) has assigned the
name CVE-2005-2337 to this issue.

Users of Ruby should update to these erratum packages, which contain a
backported patch and are not vulnerable to this issue."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://www.redhat.com/security/data/cve/CVE-2005-2337.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://rhn.redhat.com/errata/RHSA-2005-799.html"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected packages.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_set_cvss_temporal_vector("CVSS2#E:ND/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"No exploit is required");
  script_set_attribute(attribute:"exploit_available", value:"true");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:irb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:ruby");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:ruby-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:ruby-docs");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:ruby-libs");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:ruby-mode");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:ruby-tcltk");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:redhat:enterprise_linux:2.1");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:redhat:enterprise_linux:3");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:redhat:enterprise_linux:4");

  script_set_attribute(attribute:"patch_publication_date", value:"2005/10/25");
  script_set_attribute(attribute:"plugin_publication_date", value:"2005/10/19");
  script_set_attribute(attribute:"vuln_publication_date", value:"2005/09/22");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2005-2016 Tenable Network Security, Inc.");
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
if (! ereg(pattern:"^(2\.1|3|4)([^0-9]|$)", string:os_ver)) audit(AUDIT_OS_NOT, "Red Hat 2.1 / 3.x / 4.x", "Red Hat " + os_ver);

if (!get_kb_item("Host/RedHat/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && cpu !~ "^i[3-6]86$" && "s390" >!< cpu) audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Red Hat", cpu);

yum_updateinfo = get_kb_item("Host/RedHat/yum-updateinfo");
if (!empty_or_null(yum_updateinfo)) 
{
  rhsa = "RHSA-2005:799";
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
  if (rpm_check(release:"RHEL2.1", cpu:"i386", reference:"irb-1.6.4-2.AS21.2")) flag++;
  if (rpm_check(release:"RHEL2.1", cpu:"i386", reference:"ruby-1.6.4-2.AS21.2")) flag++;
  if (rpm_check(release:"RHEL2.1", cpu:"i386", reference:"ruby-devel-1.6.4-2.AS21.2")) flag++;
  if (rpm_check(release:"RHEL2.1", cpu:"i386", reference:"ruby-docs-1.6.4-2.AS21.2")) flag++;
  if (rpm_check(release:"RHEL2.1", cpu:"i386", reference:"ruby-libs-1.6.4-2.AS21.2")) flag++;
  if (rpm_check(release:"RHEL2.1", cpu:"i386", reference:"ruby-tcltk-1.6.4-2.AS21.2")) flag++;

  if (rpm_check(release:"RHEL3", reference:"irb-1.6.8-9.EL3.4")) flag++;
  if (rpm_check(release:"RHEL3", reference:"ruby-1.6.8-9.EL3.4")) flag++;
  if (rpm_check(release:"RHEL3", reference:"ruby-devel-1.6.8-9.EL3.4")) flag++;
  if (rpm_check(release:"RHEL3", reference:"ruby-docs-1.6.8-9.EL3.4")) flag++;
  if (rpm_check(release:"RHEL3", reference:"ruby-libs-1.6.8-9.EL3.4")) flag++;
  if (rpm_check(release:"RHEL3", reference:"ruby-mode-1.6.8-9.EL3.4")) flag++;
  if (rpm_check(release:"RHEL3", reference:"ruby-tcltk-1.6.8-9.EL3.4")) flag++;

  if (rpm_check(release:"RHEL4", reference:"irb-1.8.1-7.EL4.2")) flag++;
  if (rpm_check(release:"RHEL4", reference:"ruby-1.8.1-7.EL4.2")) flag++;
  if (rpm_check(release:"RHEL4", reference:"ruby-devel-1.8.1-7.EL4.2")) flag++;
  if (rpm_check(release:"RHEL4", reference:"ruby-docs-1.8.1-7.EL4.2")) flag++;
  if (rpm_check(release:"RHEL4", reference:"ruby-libs-1.8.1-7.EL4.2")) flag++;
  if (rpm_check(release:"RHEL4", reference:"ruby-mode-1.8.1-7.EL4.2")) flag++;
  if (rpm_check(release:"RHEL4", reference:"ruby-tcltk-1.8.1-7.EL4.2")) flag++;

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
    else audit(AUDIT_PACKAGE_NOT_INSTALLED, "irb / ruby / ruby-devel / ruby-docs / ruby-libs / ruby-mode / etc");
  }
}