#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from Ubuntu Security Notice USN-1361-1. The text 
# itself is copyright (C) Canonical, Inc. See 
# <http://www.ubuntu.com/usn/>. Ubuntu(R) is a registered 
# trademark of Canonical, Inc.
#

include("compat.inc");

if (description)
{
  script_id(57935);
  script_version("$Revision: 1.7 $");
  script_cvs_date("$Date: 2016/10/26 14:05:57 $");

  script_cve_id("CVE-2011-3353", "CVE-2011-4622", "CVE-2012-0038", "CVE-2012-0044");
  script_bugtraq_id(49527, 51371);
  script_osvdb_id(76259, 77985, 78226, 78227);
  script_xref(name:"USN", value:"1361-1");

  script_name(english:"Ubuntu 10.10 : linux vulnerabilities (USN-1361-1)");
  script_summary(english:"Checks dpkg output for updated packages.");

  script_set_attribute(
    attribute:"synopsis", 
    value:
"The remote Ubuntu host is missing one or more security-related
patches."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Han-Wen Nienhuys reported a flaw in the FUSE kernel module. A local
user who can mount a FUSE file system could cause a denial of service.
(CVE-2011-3353)

A flaw was found in KVM's Programmable Interval Timer (PIT). When a
virtual interrupt control is not available a local user could use this
to cause a denial of service by starting a timer. (CVE-2011-4622)

A flaw was discovered in the XFS filesystem. If a local user mounts a
specially crafted XFS image it could potential execute arbitrary code
on the system. (CVE-2012-0038)

Chen Haogang discovered an integer overflow that could result in
memory corruption. A local unprivileged user could use this to crash
the system. (CVE-2012-0044).

Note that Tenable Network Security has extracted the preceding
description block directly from the Ubuntu security advisory. Tenable
has attempted to automatically clean and format it as much as possible
without introducing additional issues."
  );
  script_set_attribute(attribute:"solution", value:"Update the affected packages.");
  script_set_cvss_base_vector("CVSS2#AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:ND/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"No known exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"false");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-image-2.6-generic");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-image-2.6-generic-pae");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-image-2.6-server");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-image-2.6-versatile");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-image-2.6-virtual");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:canonical:ubuntu_linux:10.10");

  script_set_attribute(attribute:"patch_publication_date", value:"2012/02/13");
  script_set_attribute(attribute:"plugin_publication_date", value:"2012/02/14");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"Ubuntu Security Notice (C) 2012-2016 Canonical, Inc. / NASL script (C) 2012-2016 Tenable Network Security, Inc.");
  script_family(english:"Ubuntu Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/cpu", "Host/Ubuntu", "Host/Ubuntu/release", "Host/Debian/dpkg-l");

  exit(0);
}


include("audit.inc");
include("ubuntu.inc");
include("misc_func.inc");

if ( ! get_kb_item("Host/local_checks_enabled") ) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
release = get_kb_item("Host/Ubuntu/release");
if ( isnull(release) ) audit(AUDIT_OS_NOT, "Ubuntu");
release = chomp(release);
if (! ereg(pattern:"^(10\.10)$", string:release)) audit(AUDIT_OS_NOT, "Ubuntu 10.10", "Ubuntu " + release);
if ( ! get_kb_item("Host/Debian/dpkg-l") ) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && cpu !~ "^i[3-6]86$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Ubuntu", cpu);

flag = 0;

if (ubuntu_check(osver:"10.10", pkgname:"linux-image-2.6.35-32-generic", pkgver:"2.6.35-32.65")) flag++;
if (ubuntu_check(osver:"10.10", pkgname:"linux-image-2.6.35-32-generic-pae", pkgver:"2.6.35-32.65")) flag++;
if (ubuntu_check(osver:"10.10", pkgname:"linux-image-2.6.35-32-server", pkgver:"2.6.35-32.65")) flag++;
if (ubuntu_check(osver:"10.10", pkgname:"linux-image-2.6.35-32-versatile", pkgver:"2.6.35-32.65")) flag++;
if (ubuntu_check(osver:"10.10", pkgname:"linux-image-2.6.35-32-virtual", pkgver:"2.6.35-32.65")) flag++;

if (flag)
{
  security_report_v4(
    port       : 0,
    severity   : SECURITY_HOLE,
    extra      : ubuntu_report_get()
  );
  exit(0);
}
else
{
  tested = ubuntu_pkg_tests_get();
  if (tested) audit(AUDIT_PACKAGE_NOT_AFFECTED, tested);
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "linux-image-2.6-generic / linux-image-2.6-generic-pae / etc");
}
