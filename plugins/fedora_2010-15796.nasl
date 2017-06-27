#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Fedora Security Advisory 2010-15796.
#

include("compat.inc");

if (description)
{
  script_id(49987);
  script_version("$Revision: 1.9 $");
  script_cvs_date("$Date: 2015/10/20 21:13:52 $");

  script_bugtraq_id(43585);
  script_xref(name:"FEDORA", value:"2010-15796");

  script_name(english:"Fedora 14 : php-pear-CAS-1.1.3-1.fc14 (2010-15796)");
  script_summary(english:"Checks rpm output for the updated package.");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Fedora host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"This release contains 3 security fixes for vulnerabilities in the
proxy callback mechanism. These vulnerabilities only affect phpCAS
clients that are running in proxy() mode. The release is fully
compatible with all versions 1.1.x versions.

The changes are :

Security Issue

  - CVE-2010-3690 phpCAS: XSS during a proxy callback
    [PHPCAS-80] (Joachim Fritschi)

    - CVE-2010-3691 phpCAS: prevent symlink attacks during a
      proxy callback [PHPCAS-80] (Joachim Fritschi)

    - CVE-2010-3692 phpCAS: directory traversal during a
      proxy callback [PHPCAS-80] (Joachim Fritschi)

Bug Fixes

  - fix broken redirection with safari [PHPCAS-79] (Alex
    Barker)

    - fix missing exit() call during ticket validation
      [PHPCAS-76] (Igor Blanco,Joachim Fritschi)

    - fix a notice because REQUEST_URL is not defined on IIS
      [PHPCAS-81] (Inaki Arenaza)

    - fix a typo in pgt-db.php [PHPCAS-75] (Julien
      Cochennec)

    - removal of the non functional pgt-db backend
      [PHPCAS-81] (Joachim Fritschi)

Note that Tenable Network Security has extracted the preceding
description block directly from the Fedora security advisory. Tenable
has attempted to automatically clean and format it as much as possible
without introducing additional issues."
  );
  # https://lists.fedoraproject.org/pipermail/package-announce/2010-October/049360.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?5eaa1cd7"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected php-pear-CAS package."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:F/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:fedoraproject:fedora:php-pear-CAS");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:fedoraproject:fedora:14");

  script_set_attribute(attribute:"patch_publication_date", value:"2010/10/05");
  script_set_attribute(attribute:"plugin_publication_date", value:"2010/10/15");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2010-2015 Tenable Network Security, Inc.");
  script_family(english:"Fedora Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/RedHat/release", "Host/RedHat/rpm-list");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("rpm.inc");

if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
release = get_kb_item("Host/RedHat/release");
if (isnull(release) || "Fedora" >!< release) audit(AUDIT_OS_NOT, "Fedora");
os_ver = eregmatch(pattern: "Fedora.*release ([0-9]+)", string:release);
if (isnull(os_ver)) audit(AUDIT_UNKNOWN_APP_VER, "Fedora");
os_ver = os_ver[1];
if (! ereg(pattern:"^14([^0-9]|$)", string:os_ver)) audit(AUDIT_OS_NOT, "Fedora 14.x", "Fedora " + os_ver);

if (!get_kb_item("Host/RedHat/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && cpu !~ "^i[3-6]86$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Fedora", cpu);

flag = 0;
if (rpm_check(release:"FC14", reference:"php-pear-CAS-1.1.3-1.fc14")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:rpm_report_get());
  else security_hole(0);
  exit(0);
}
else
{
  tested = pkg_tests_get();
  if (tested) audit(AUDIT_PACKAGE_NOT_AFFECTED, tested);
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "php-pear-CAS");
}