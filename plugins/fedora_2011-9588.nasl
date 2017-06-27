#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Fedora Security Advisory 2011-9588.
#

include("compat.inc");

if (description)
{
  script_id(55875);
  script_version("$Revision: 1.6 $");
  script_cvs_date("$Date: 2015/10/20 22:15:24 $");

  script_cve_id("CVE-2011-2711");
  script_osvdb_id(74050);
  script_xref(name:"FEDORA", value:"2011-9588");

  script_name(english:"Fedora 14 : cgit-0.9.0.2-2.fc14 (2011-9588)");
  script_summary(english:"Checks rpm output for the updated package.");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Fedora host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"This update fixes a potential XSS vulnerability. A malicious user
would need push access to the git server in order to exploit this
issue. Refer to the cgit mailing list for :

Numerous minor bugs are also fixed. For details, refer to the upstream
release announcements for 0.9.0.1 and 0.9.0.2.

http://hjemli.net/pipermail/cgit/2011-July/000276.html
http://hjemli.net/pipermail/cgit/2011-June/000183.html
http://hjemli.net/pipermail/cgit/2011-July/000273.html

Note that Tenable Network Security has extracted the preceding
description block directly from the Fedora security advisory. Tenable
has attempted to automatically clean and format it as much as possible
without introducing additional issues."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://hjemli.net/pipermail/cgit/2011-July/000273.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://hjemli.net/pipermail/cgit/2011-July/000276.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://hjemli.net/pipermail/cgit/2011-June/000183.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://bugzilla.redhat.com/show_bug.cgi?id=725042"
  );
  # https://lists.fedoraproject.org/pipermail/package-announce/2011-August/063762.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?4ab3150d"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected cgit package.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:S/C:N/I:P/A:N");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:fedoraproject:fedora:cgit");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:fedoraproject:fedora:14");

  script_set_attribute(attribute:"patch_publication_date", value:"2011/07/23");
  script_set_attribute(attribute:"plugin_publication_date", value:"2011/08/17");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2011-2015 Tenable Network Security, Inc.");
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
if (rpm_check(release:"FC14", reference:"cgit-0.9.0.2-2.fc14")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_note(port:0, extra:rpm_report_get());
  else security_note(0);
  exit(0);
}
else
{
  tested = pkg_tests_get();
  if (tested) audit(AUDIT_PACKAGE_NOT_AFFECTED, tested);
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "cgit");
}