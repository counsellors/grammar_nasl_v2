#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Fedora Security Advisory 2011-17386.
#

include("compat.inc");

if (description)
{
  script_id(57425);
  script_version("$Revision: 1.7 $");
  script_cvs_date("$Date: 2015/10/20 22:05:52 $");

  script_xref(name:"FEDORA", value:"2011-17386");

  script_name(english:"Fedora 16 : glibc-2.14.90-24.fc16.4 (2011-17386)");
  script_summary(english:"Checks rpm output for the updated package.");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Fedora host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Reverts 552960 patch which is causing a variety of problems.

  - Sun Dec 18 2011 Jeff Law <law at redhat.com> -
    2.14.90-24.fc16.3

    - Check values from TZ file header (#767696)

    - Handle EAGAIN from FUTEX_WAIT_REQUEUE_PI (#552960)

    - Add {dist}.#

    - Correct return value from pthread_create when stack
      allocation fails. (#767746)

  - Wed Dec 7 2011 Jeff Law <law at redhat.com> - 2.14.90-23

    - Fix a wrong constant in powerpc hypot implementation
      (#750811) #13534 in python bug database #13472 in
      glibc bug database

  - Truncate time values in Linux futimes when falling back
    to utime

  - Mon Dec 5 2011 Jeff Law <law at redhat.com> - 2.14.90-22

    - Mark fortified __FD_ELT as extension (#761021)

    - Fix typo in manual (#708455)

  - Check values from TZ file header (#767696)

    - Handle EAGAIN from FUTEX_WAIT_REQUEUE_PI (#552960)

    - Add {dist}.#

    - Correct return value from pthread_create when stack
      allocation fails. (#767746)

  - Fix a wrong constant in powerpc hypot implementation
    (#750811) #13534 in python bug database #13472 in glibc
    bug database

  - Truncate time values in Linux futimes when falling back
    to utime

  - Mark fortified __FD_ELT as extension (#761021)

    - Fix typo in manual (#708455)

Note that Tenable Network Security has extracted the preceding
description block directly from the Fedora security advisory. Tenable
has attempted to automatically clean and format it as much as possible
without introducing additional issues."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://bugzilla.redhat.com/show_bug.cgi?id=750811"
  );
  # https://lists.fedoraproject.org/pipermail/package-announce/2011-December/071482.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?64a8419e"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected glibc package.");
  script_set_attribute(attribute:"risk_factor", value:"High");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:fedoraproject:fedora:glibc");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:fedoraproject:fedora:16");

  script_set_attribute(attribute:"patch_publication_date", value:"2011/12/23");
  script_set_attribute(attribute:"plugin_publication_date", value:"2012/01/03");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2012-2015 Tenable Network Security, Inc.");
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
if (! ereg(pattern:"^16([^0-9]|$)", string:os_ver)) audit(AUDIT_OS_NOT, "Fedora 16.x", "Fedora " + os_ver);

if (!get_kb_item("Host/RedHat/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && cpu !~ "^i[3-6]86$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Fedora", cpu);

flag = 0;
if (rpm_check(release:"FC16", reference:"glibc-2.14.90-24.fc16.4")) flag++;


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
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "glibc");
}