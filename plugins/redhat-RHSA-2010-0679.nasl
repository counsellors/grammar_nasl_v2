#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Red Hat Security Advisory RHSA-2010:0679. The text 
# itself is copyright (C) Red Hat, Inc.
#

include("compat.inc");

if (description)
{
  script_id(49131);
  script_version ("$Revision: 1.11 $");
  script_cvs_date("$Date: 2017/01/04 15:51:48 $");

  script_cve_id("CVE-2005-4889", "CVE-2010-2059", "CVE-2010-2199");
  script_bugtraq_id(40512);
  script_xref(name:"RHSA", value:"2010:0679");

  script_name(english:"RHEL 5 : rpm (RHSA-2010:0679)");
  script_summary(english:"Checks the rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Red Hat host is missing one or more security updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Updated rpm packages that fix one security issue and one bug are now
available for Red Hat Enterprise Linux 5.

The Red Hat Security Response Team has rated this update as having
moderate security impact. A Common Vulnerability Scoring System (CVSS)
base score, which gives a detailed severity rating, is available from
the CVE link in the References section.

The RPM Package Manager (RPM) is a command line driven package
management system capable of installing, uninstalling, verifying,
querying, and updating software packages.

It was discovered that RPM did not remove setuid and setgid bits set
on binaries when upgrading packages. A local attacker able to create
hard links to binaries could use this flaw to keep those binaries on
the system, at a specific version level and with the setuid or setgid
bit set, even if the package providing them was upgraded by a system
administrator. This could have security implications if a package was
upgraded because of a security flaw in a setuid or setgid program.
(CVE-2010-2059)

This update also fixes the following bug :

* A memory leak in the communication between RPM and the
Security-Enhanced Linux (SELinux) subsystem, which could have caused
extensive memory consumption. In reported cases, this issue was
triggered by running rhn_check when errata were scheduled to be
applied. (BZ#627630)

All users of rpm are advised to upgrade to these updated packages,
which contain backported patches to correct these issues."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://www.redhat.com/security/data/cve/CVE-2010-2059.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://rhn.redhat.com/errata/RHSA-2010-0679.html"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected packages.");
  script_set_cvss_base_vector("CVSS2#AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:F/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:popt");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:rpm");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:rpm-apidocs");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:rpm-build");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:rpm-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:rpm-libs");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:redhat:enterprise_linux:rpm-python");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:redhat:enterprise_linux:5");

  script_set_attribute(attribute:"patch_publication_date", value:"2010/09/07");
  script_set_attribute(attribute:"plugin_publication_date", value:"2010/09/08");
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
if (! ereg(pattern:"^5([^0-9]|$)", string:os_ver)) audit(AUDIT_OS_NOT, "Red Hat 5.x", "Red Hat " + os_ver);

if (!get_kb_item("Host/RedHat/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && cpu !~ "^i[3-6]86$" && "s390" >!< cpu) audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Red Hat", cpu);

yum_updateinfo = get_kb_item("Host/RedHat/yum-updateinfo");
if (!empty_or_null(yum_updateinfo)) 
{
  rhsa = "RHSA-2010:0679";
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
  if (rpm_check(release:"RHEL5", reference:"popt-1.10.2.3-20.el5_5.1")) flag++;
  if (rpm_check(release:"RHEL5", cpu:"i386", reference:"rpm-4.4.2.3-20.el5_5.1")) flag++;
  if (rpm_check(release:"RHEL5", cpu:"s390x", reference:"rpm-4.4.2.3-20.el5_5.1")) flag++;
  if (rpm_check(release:"RHEL5", cpu:"x86_64", reference:"rpm-4.4.2.3-20.el5_5.1")) flag++;
  if (rpm_check(release:"RHEL5", cpu:"i386", reference:"rpm-apidocs-4.4.2.3-20.el5_5.1")) flag++;
  if (rpm_check(release:"RHEL5", cpu:"s390x", reference:"rpm-apidocs-4.4.2.3-20.el5_5.1")) flag++;
  if (rpm_check(release:"RHEL5", cpu:"x86_64", reference:"rpm-apidocs-4.4.2.3-20.el5_5.1")) flag++;
  if (rpm_check(release:"RHEL5", cpu:"i386", reference:"rpm-build-4.4.2.3-20.el5_5.1")) flag++;
  if (rpm_check(release:"RHEL5", cpu:"s390x", reference:"rpm-build-4.4.2.3-20.el5_5.1")) flag++;
  if (rpm_check(release:"RHEL5", cpu:"x86_64", reference:"rpm-build-4.4.2.3-20.el5_5.1")) flag++;
  if (rpm_check(release:"RHEL5", reference:"rpm-devel-4.4.2.3-20.el5_5.1")) flag++;
  if (rpm_check(release:"RHEL5", reference:"rpm-libs-4.4.2.3-20.el5_5.1")) flag++;
  if (rpm_check(release:"RHEL5", cpu:"i386", reference:"rpm-python-4.4.2.3-20.el5_5.1")) flag++;
  if (rpm_check(release:"RHEL5", cpu:"s390x", reference:"rpm-python-4.4.2.3-20.el5_5.1")) flag++;
  if (rpm_check(release:"RHEL5", cpu:"x86_64", reference:"rpm-python-4.4.2.3-20.el5_5.1")) flag++;

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
    else audit(AUDIT_PACKAGE_NOT_INSTALLED, "popt / rpm / rpm-apidocs / rpm-build / rpm-devel / rpm-libs / etc");
  }
}