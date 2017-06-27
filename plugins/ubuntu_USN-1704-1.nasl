#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from Ubuntu Security Notice USN-1704-1. The text 
# itself is copyright (C) Canonical, Inc. See 
# <http://www.ubuntu.com/usn/>. Ubuntu(R) is a registered 
# trademark of Canonical, Inc.
#

include("compat.inc");

if (description)
{
  script_id(63669);
  script_version("$Revision: 1.7 $");
  script_cvs_date("$Date: 2016/10/26 14:05:58 $");

  script_cve_id("CVE-2012-0957", "CVE-2012-4461", "CVE-2012-4508", "CVE-2012-4530", "CVE-2012-4565", "CVE-2012-5517", "CVE-2012-5532");
  script_bugtraq_id(55855, 55878, 56238, 56346, 56414, 56527, 56710);
  script_osvdb_id(86133, 86575, 87098, 87966, 88048, 88156, 88504);
  script_xref(name:"USN", value:"1704-1");

  script_name(english:"Ubuntu 12.04 LTS : linux-lts-quantal - Linux kernel hardware enablement from Quantal vulnerabilities (USN-1704-1)");
  script_summary(english:"Checks dpkg output for updated package.");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Ubuntu host is missing a security-related patch."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Brad Spengler discovered a flaw in the Linux kernel's uname system
call. An unprivileged user could exploit this flaw to read kernel
stack memory. (CVE-2012-0957)

Jon Howell reported a flaw in the Linux kernel's KVM (Kernel-based
virtual machine) subsystem's handling of the XSAVE feature. On hosts,
using qemu userspace, without the XSAVE feature an unprivileged local
attacker could exploit this flaw to crash the system. (CVE-2012-4461)

Dmitry Monakhov reported a race condition flaw the Linux ext4
filesystem that can expose stale data. An unprivileged user could
exploit this flaw to cause an information leak. (CVE-2012-4508)

A flaw was discovered in the Linux kernel's handling of script
execution when module loading is enabled. A local attacker could
exploit this flaw to cause a leak of kernel stack contents.
(CVE-2012-4530)

Rodrigo Freire discovered a flaw in the Linux kernel's TCP illinois
congestion control algorithm. A local attacker could use this to cause
a denial of service. (CVE-2012-4565)

A flaw was discovered in the Linux kernel's handling of new
hot-plugged memory. An unprivileged local user could exploit this flaw
to cause a denial of service by crashing the system. (CVE-2012-5517)

Florian Weimer discovered that hypervkvpd, which is distributed in the
Linux kernel, was not correctly validating source addresses of netlink
packets. An untrusted local user can cause a denial of service by
causing hypervkvpd to exit. (CVE-2012-5532).

Note that Tenable Network Security has extracted the preceding
description block directly from the Ubuntu security advisory. Tenable
has attempted to automatically clean and format it as much as possible
without introducing additional issues."
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected linux-image-3.5-generic package."
  );
  script_set_cvss_base_vector("CVSS2#AV:L/AC:L/Au:N/C:C/I:N/A:N");
  script_set_cvss_temporal_vector("CVSS2#E:ND/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:linux-image-3.5-generic");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:canonical:ubuntu_linux:12.04:-:lts");

  script_set_attribute(attribute:"patch_publication_date", value:"2013/01/22");
  script_set_attribute(attribute:"plugin_publication_date", value:"2013/01/23");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"Ubuntu Security Notice (C) 2013-2016 Canonical, Inc. / NASL script (C) 2013-2016 Tenable Network Security, Inc.");
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
if (! ereg(pattern:"^(12\.04)$", string:release)) audit(AUDIT_OS_NOT, "Ubuntu 12.04", "Ubuntu " + release);
if ( ! get_kb_item("Host/Debian/dpkg-l") ) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && cpu !~ "^i[3-6]86$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Ubuntu", cpu);

flag = 0;

if (ubuntu_check(osver:"12.04", pkgname:"linux-image-3.5.0-22-generic", pkgver:"3.5.0-22.34~precise1")) flag++;

if (flag)
{
  security_report_v4(
    port       : 0,
    severity   : SECURITY_WARNING,
    extra      : ubuntu_report_get()
  );
  exit(0);
}
else
{
  tested = ubuntu_pkg_tests_get();
  if (tested) audit(AUDIT_PACKAGE_NOT_AFFECTED, tested);
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "linux-image-3.5-generic");
}