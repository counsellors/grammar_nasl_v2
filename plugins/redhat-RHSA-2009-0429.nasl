#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Red Hat Security Advisory RHSA-2009:0429. The text 
# itself is copyright (C) Red Hat, Inc.
#

include("compat.inc");

if (description)
{
  script_id(36179);
  script_version ("$Revision: 1.23 $");
  script_cvs_date("$Date: 2017/01/03 17:27:01 $");

  script_cve_id("CVE-2009-0146", "CVE-2009-0147", "CVE-2009-0163", "CVE-2009-0166", "CVE-2009-0195", "CVE-2009-0799", "CVE-2009-0800", "CVE-2009-1179", "CVE-2009-1180", "CVE-2009-1181", "CVE-2009-1182", "CVE-2009-1183");
  script_bugtraq_id(34571);
  script_osvdb_id(54462, 54465, 54466, 54467, 54468, 54469, 54470, 54471, 54472, 54473, 54476, 54477, 54478, 54479, 54480, 54481, 54482, 54483, 54484, 54485, 54486, 54487, 54488, 54489, 54495, 54496);
  script_xref(name:"RHSA", value:"2009:0429");

  script_name(english:"RHEL 4 / 5 : cups (RHSA-2009:0429)");
  script_summary(english:"Checks the rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Red Hat host is missing one or more security updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Updated cups packages that fix multiple security issues are now
available for Red Hat Enterprise Linux 4 and 5.

This update has been rated as having important security impact by the
Red Hat Security Response Team.

The Common UNIX(r) Printing System (CUPS) provides a portable printing
layer for UNIX operating systems.

Multiple integer overflow flaws were found in the CUPS JBIG2 decoder.
An attacker could create a malicious PDF file that would cause CUPS to
crash or, potentially, execute arbitrary code as the 'lp' user if the
file was printed. (CVE-2009-0147, CVE-2009-1179)

Multiple buffer overflow flaws were found in the CUPS JBIG2 decoder.
An attacker could create a malicious PDF file that would cause CUPS to
crash or, potentially, execute arbitrary code as the 'lp' user if the
file was printed. (CVE-2009-0146, CVE-2009-1182)

Multiple flaws were found in the CUPS JBIG2 decoder that could lead to
the freeing of arbitrary memory. An attacker could create a malicious
PDF file that would cause CUPS to crash or, potentially, execute
arbitrary code as the 'lp' user if the file was printed.
(CVE-2009-0166, CVE-2009-1180)

Multiple input validation flaws were found in the CUPS JBIG2 decoder.
An attacker could create a malicious PDF file that would cause CUPS to
crash or, potentially, execute arbitrary code as the 'lp' user if the
file was printed. (CVE-2009-0800)

An integer overflow flaw, leading to a heap-based buffer overflow, was
discovered in the Tagged Image File Format (TIFF) decoding routines
used by the CUPS image-converting filters, 'imagetops' and
'imagetoraster'. An attacker could create a malicious TIFF file that
could, potentially, execute arbitrary code as the 'lp' user if the
file was printed. (CVE-2009-0163)

Multiple denial of service flaws were found in the CUPS JBIG2 decoder.
An attacker could create a malicious PDF file that would cause CUPS to
crash when printed. (CVE-2009-0799, CVE-2009-1181, CVE-2009-1183)

Red Hat would like to thank Aaron Sigel, Braden Thomas and Drew Yao of
the Apple Product Security team, and Will Dormann of the CERT/CC for
responsibly reporting these flaws.

Users of cups are advised to upgrade to these updated packages, which
contain backported patches to correct these issues. After installing
the update, the cupsd daemon will be restarted automatically."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://www.redhat.com/security/data/cve/CVE-2009-0146.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://www.redhat.com/security/data/cve/CVE-2009-0147.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://www.redhat.com/security/data/cve/CVE-2009-0163.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://www.redhat.com/security/data/cve/CVE-2009-0166.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://www.redhat.com/security/data/cve/CVE-2009-0195.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://www.redhat.com/security/data/cve/CVE-2009-0799.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://www.redhat.com/security/data/cve/CVE-2009-0800.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://www.redhat.com/security/data/cve/CVE-2009-1179.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://www.redhat.com/security/data/cve/CVE-2009-1180.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://www.redhat.com/security/data/cve/CVE-2009-1181.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://www.redhat.com/security/data/cve/CVE-2009-1182.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://www.redhat.com/security/data/cve/CVE-2009-1183.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://rhn.redhat.com/errata/RHSA-2009-0429.html"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected packages.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_set_cvss_temporal_vector("CVSS2#E:ND/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"No known exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"false");
  script_cwe_id(20, 119, 189, 399);

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:cups");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:cups-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:cups-libs");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:cups-lpd");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:redhat:enterprise_linux:4");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:redhat:enterprise_linux:4.7");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:redhat:enterprise_linux:5");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:redhat:enterprise_linux:5.3");

  script_set_attribute(attribute:"patch_publication_date", value:"2009/04/16");
  script_set_attribute(attribute:"plugin_publication_date", value:"2009/04/17");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2009-2017 Tenable Network Security, Inc.");
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

yum_updateinfo = get_kb_item("Host/RedHat/yum-updateinfo");
if (!empty_or_null(yum_updateinfo)) 
{
  rhsa = "RHSA-2009:0429";
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
  if (rpm_check(release:"RHEL4", reference:"cups-1.1.22-0.rc1.9.27.el4_7.5")) flag++;

  if (rpm_check(release:"RHEL4", reference:"cups-devel-1.1.22-0.rc1.9.27.el4_7.5")) flag++;

  if (rpm_check(release:"RHEL4", reference:"cups-libs-1.1.22-0.rc1.9.27.el4_7.5")) flag++;


  if (rpm_check(release:"RHEL5", cpu:"i386", reference:"cups-1.3.7-8.el5_3.4")) flag++;

  if (rpm_check(release:"RHEL5", cpu:"s390x", reference:"cups-1.3.7-8.el5_3.4")) flag++;

  if (rpm_check(release:"RHEL5", cpu:"x86_64", reference:"cups-1.3.7-8.el5_3.4")) flag++;

  if (rpm_check(release:"RHEL5", reference:"cups-devel-1.3.7-8.el5_3.4")) flag++;

  if (rpm_check(release:"RHEL5", reference:"cups-libs-1.3.7-8.el5_3.4")) flag++;

  if (rpm_check(release:"RHEL5", cpu:"i386", reference:"cups-lpd-1.3.7-8.el5_3.4")) flag++;

  if (rpm_check(release:"RHEL5", cpu:"s390x", reference:"cups-lpd-1.3.7-8.el5_3.4")) flag++;

  if (rpm_check(release:"RHEL5", cpu:"x86_64", reference:"cups-lpd-1.3.7-8.el5_3.4")) flag++;


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
    else audit(AUDIT_PACKAGE_NOT_INSTALLED, "cups / cups-devel / cups-libs / cups-lpd");
  }
}