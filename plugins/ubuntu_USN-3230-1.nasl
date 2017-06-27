#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from Ubuntu Security Notice USN-3230-1. The text 
# itself is copyright (C) Canonical, Inc. See 
# <http://www.ubuntu.com/usn/>. Ubuntu(R) is a registered 
# trademark of Canonical, Inc.
#

include("compat.inc");

if (description)
{
  script_id(97723);
  script_version("$Revision: 3.2 $");
  script_cvs_date("$Date: 2017/03/16 14:01:52 $");

  script_cve_id("CVE-2014-9601", "CVE-2016-9189", "CVE-2016-9190");
  script_osvdb_id(116760, 145156, 146696);
  script_xref(name:"USN", value:"3230-1");

  script_name(english:"Ubuntu 14.04 LTS / 16.04 LTS / 16.10 : pillow vulnerabilities (USN-3230-1)");
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
"It was discovered that Pillow incorrectly handled certain compressed
text chunks in PNG images. A remote attacker could possibly use this
issue to cause Pillow to crash, resulting in a denial of service. This
issue only affected Ubuntu 14.04 LTS. (CVE-2014-9601)

Cris Neckar discovered that Pillow incorrectly handled certain
malformed images. A remote attacker could use this issue to cause
Pillow to crash, resulting in a denial of service, or possibly obtain
sensitive information. (CVE-2016-9189)

Cris Neckar discovered that Pillow incorrectly handled certain
malformed images. A remote attacker could use this issue to cause
Pillow to crash, resulting in a denial of service, or possibly execute
arbitrary code. (CVE-2016-9190).

Note that Tenable Network Security has extracted the preceding
description block directly from the Ubuntu security advisory. Tenable
has attempted to automatically clean and format it as much as possible
without introducing additional issues."
  );
  script_set_attribute(attribute:"solution", value:"Update the affected packages.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_set_cvss_temporal_vector("CVSS2#E:U/RL:OF/RC:C");
  script_set_cvss3_base_vector("CVSS:3.0/AV:L/AC:L/PR:N/UI:R/S:U/C:H/I:H/A:H");
  script_set_attribute(attribute:"exploitability_ease", value:"No known exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"false");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:python-imaging");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:python-pil");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:python3-imaging");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:canonical:ubuntu_linux:python3-pil");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:canonical:ubuntu_linux:14.04");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:canonical:ubuntu_linux:16.04");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:canonical:ubuntu_linux:16.10");

  script_set_attribute(attribute:"patch_publication_date", value:"2017/03/13");
  script_set_attribute(attribute:"plugin_publication_date", value:"2017/03/14");
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
if (! ereg(pattern:"^(14\.04|16\.04|16\.10)$", string:release)) audit(AUDIT_OS_NOT, "Ubuntu 14.04 / 16.04 / 16.10", "Ubuntu " + release);
if ( ! get_kb_item("Host/Debian/dpkg-l") ) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && cpu !~ "^i[3-6]86$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Ubuntu", cpu);

flag = 0;

if (ubuntu_check(osver:"14.04", pkgname:"python-imaging", pkgver:"2.3.0-1ubuntu3.4")) flag++;
if (ubuntu_check(osver:"14.04", pkgname:"python-pil", pkgver:"2.3.0-1ubuntu3.4")) flag++;
if (ubuntu_check(osver:"14.04", pkgname:"python3-imaging", pkgver:"2.3.0-1ubuntu3.4")) flag++;
if (ubuntu_check(osver:"14.04", pkgname:"python3-pil", pkgver:"2.3.0-1ubuntu3.4")) flag++;
if (ubuntu_check(osver:"16.04", pkgname:"python-imaging", pkgver:"3.1.2-0ubuntu1.1")) flag++;
if (ubuntu_check(osver:"16.04", pkgname:"python-pil", pkgver:"3.1.2-0ubuntu1.1")) flag++;
if (ubuntu_check(osver:"16.04", pkgname:"python3-pil", pkgver:"3.1.2-0ubuntu1.1")) flag++;
if (ubuntu_check(osver:"16.10", pkgname:"python-imaging", pkgver:"3.3.1-1ubuntu0.1")) flag++;
if (ubuntu_check(osver:"16.10", pkgname:"python-pil", pkgver:"3.3.1-1ubuntu0.1")) flag++;
if (ubuntu_check(osver:"16.10", pkgname:"python3-pil", pkgver:"3.3.1-1ubuntu0.1")) flag++;

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
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "python-imaging / python-pil / python3-imaging / python3-pil");
}