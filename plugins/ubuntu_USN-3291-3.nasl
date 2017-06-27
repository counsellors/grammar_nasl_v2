#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from Ubuntu Security Notice USN-3291-3. The text 
# itself is copyright (C) Canonical, Inc. See 
# <http://www.ubuntu.com/usn/>. Ubuntu(R) is a registered 
# trademark of Canonical, Inc.
#

include("compat.inc");

if (description)
{
  script_id(100267);
  script_version("$Revision: 3.2 $");
  script_cvs_date("$Date: 2017/05/22 13:36:33 $");

  script_cve_id("CVE-2017-7187", "CVE-2017-7261", "CVE-2017-7294", "CVE-2017-7616");
  script_osvdb_id(154043, 154359, 154548, 155190);
  script_xref(name:"USN", value:"3291-3");

  script_name(english:"Ubuntu 14.04 LTS : linux-lts-xenial vulnerabilities (USN-3291-3)");
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
"USN-3291-1 fixed vulnerabilities in the Linux kernel for Ubuntu 16.04
LTS. This update provides the corresponding updates for the Linux
Hardware Enablement (HWE) kernel from Ubuntu 16.04 LTS for Ubuntu
14.04 LTS.

Dmitry Vyukov discovered that the generic SCSI (sg) subsystem in the
Linux kernel contained a stack-based buffer overflow. A local attacker
with access to an sg device could use this to cause a denial of
service (system crash) or possibly execute arbitrary code.
(CVE-2017-7187)

It was discovered that a NULL pointer dereference existed in the
Direct Rendering Manager (DRM) driver for VMware devices in the Linux
kernel. A local attacker could use this to cause a denial of service
(system crash). (CVE-2017-7261)

Li Qiang discovered that an integer overflow vulnerability existed in
the Direct Rendering Manager (DRM) driver for VMware devices in the
Linux kernel. A local attacker could use this to cause a denial of
service (system crash) or possibly execute arbitrary code.
(CVE-2017-7294)

It was discovered that an information leak existed in the
set_mempolicy and mbind compat syscalls in the Linux kernel. A local
attacker could use this to expose sensitive information (kernel
memory). (CVE-2017-7616).

Note that Tenable Network Security has extracted the preceding
description block directly from the Ubuntu security advisory. Tenable
has attempted to automatically clean and format it as much as possible
without introducing additional issues."
  );
  script_set_attribute(attribute:"solution", value:"Update the affected packages.");
  script_set_cvss_base_vector("CVSS2#AV:L/AC:L/Au:N/C:C/I:C/A:C");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-image-4.4-generic");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-image-4.4-generic-lpae");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-image-4.4-lowlatency");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-image-generic-lpae-lts-xenial");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-image-generic-lts-xenial");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-image-lowlatency-lts-xenial");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:canonical:ubuntu_linux:14.04");

  script_set_attribute(attribute:"patch_publication_date", value:"2017/05/17");
  script_set_attribute(attribute:"plugin_publication_date", value:"2017/05/18");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"Ubuntu Security Notice (C) 2017 Canonical, Inc. / NASL script (C) 2017 Tenable Network Security, Inc.");
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
if (! ereg(pattern:"^(14\.04)$", string:release)) audit(AUDIT_OS_NOT, "Ubuntu 14.04", "Ubuntu " + release);
if ( ! get_kb_item("Host/Debian/dpkg-l") ) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && cpu !~ "^i[3-6]86$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Ubuntu", cpu);

flag = 0;

if (ubuntu_check(osver:"14.04", pkgname:"linux-image-4.4.0-78-generic", pkgver:"4.4.0-78.99~14.04.2")) flag++;
if (ubuntu_check(osver:"14.04", pkgname:"linux-image-4.4.0-78-generic-lpae", pkgver:"4.4.0-78.99~14.04.2")) flag++;
if (ubuntu_check(osver:"14.04", pkgname:"linux-image-4.4.0-78-lowlatency", pkgver:"4.4.0-78.99~14.04.2")) flag++;
if (ubuntu_check(osver:"14.04", pkgname:"linux-image-generic-lpae-lts-xenial", pkgver:"4.4.0.78.63")) flag++;
if (ubuntu_check(osver:"14.04", pkgname:"linux-image-generic-lts-xenial", pkgver:"4.4.0.78.63")) flag++;
if (ubuntu_check(osver:"14.04", pkgname:"linux-image-lowlatency-lts-xenial", pkgver:"4.4.0.78.63")) flag++;

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
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "linux-image-4.4-generic / linux-image-4.4-generic-lpae / etc");
}