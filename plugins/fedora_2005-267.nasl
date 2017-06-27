#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Fedora Security Advisory 2005-267.
#

include("compat.inc");

if (description)
{
  script_id(18326);
  script_version ("$Revision: 1.13 $");
  script_cvs_date("$Date: 2015/10/21 21:38:04 $");

  script_cve_id("CVE-2005-0891");
  script_xref(name:"FEDORA", value:"2005-267");

  script_name(english:"Fedora Core 2 : gtk2-2.4.14-2.fc2 (2005-267)");
  script_summary(english:"Checks rpm output for the updated packages.");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Fedora Core host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"David Costanzo found a bug in the way GTK+ processes BMP images. It is
possible that a specially crafted BMP image could cause a denial of
service attack in applications linked against GTK+. The Common
Vulnerabilities and Exposures project (cve.mitre.org) has assigned the
name CVE-2005-0891 to this issue.

Note that Tenable Network Security has extracted the preceding
description block directly from the Fedora security advisory. Tenable
has attempted to automatically clean and format it as much as possible
without introducing additional issues."
  );
  # https://lists.fedoraproject.org/pipermail/announce/2005-March/000828.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?710f5053"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected gtk2 and / or gtk2-devel packages."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_cwe_id(119);

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:fedoraproject:fedora:gtk2");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:fedoraproject:fedora:gtk2-devel");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:fedoraproject:fedora_core:2");

  script_set_attribute(attribute:"patch_publication_date", value:"2005/03/30");
  script_set_attribute(attribute:"plugin_publication_date", value:"2005/05/19");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2005-2015 Tenable Network Security, Inc.");
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
if (! ereg(pattern:"^2([^0-9]|$)", string:os_ver)) audit(AUDIT_OS_NOT, "Fedora 2.x", "Fedora " + os_ver);

if (!get_kb_item("Host/RedHat/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && cpu !~ "^i[3-6]86$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Fedora", cpu);

flag = 0;
if (rpm_check(release:"FC2", reference:"gtk2-2.4.14-2.fc2")) flag++;
if (rpm_check(release:"FC2", cpu:"i386", reference:"gtk2-devel-2.4.14-2.fc2")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:rpm_report_get());
  else security_warning(0);
  exit(0);
}
else
{
  tested = pkg_tests_get();
  if (tested) audit(AUDIT_PACKAGE_NOT_AFFECTED, tested);
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "gtk2 / gtk2-devel");
}