#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Debian Security Advisory DSA-1395. The text 
# itself is copyright (C) Software in the Public Interest, Inc.
#

include("compat.inc");

if (description)
{
  script_id(27577);
  script_version("$Revision: 1.11 $");
  script_cvs_date("$Date: 2013/05/17 23:45:44 $");

  script_cve_id("CVE-2007-3919");
  script_osvdb_id(41342, 41343);
  script_xref(name:"DSA", value:"1395");

  script_name(english:"Debian DSA-1395-1 : xen-utils - insecure temporary files");
  script_summary(english:"Checks dpkg output for the updated package");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Debian host is missing a security-related update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Steve Kemp from the Debian Security Audit project discovered that
xen-utils, a collection of XEN administrative tools, used temporary
files insecurely within the xenmon tool allowing local users to
truncate arbitrary files."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=447795"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.debian.org/security/2007/dsa-1395"
  );
  script_set_attribute(
    attribute:"solution", 
    value:
"Upgrade the xen-3.0 package.

For the old stable distribution (sarge) this package was not present.

For the stable distribution (etch) this problem has been fixed in
version 3.0.3-0-4."
  );
  script_set_cvss_base_vector("CVSS2#AV:L/AC:M/Au:S/C:N/I:C/A:C");
  script_cwe_id(59);

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:debian:debian_linux:xen-utils");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:debian:debian_linux:4.0");

  script_set_attribute(attribute:"patch_publication_date", value:"2007/10/25");
  script_set_attribute(attribute:"plugin_publication_date", value:"2007/10/26");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2007-2013 Tenable Network Security, Inc.");
  script_family(english:"Debian Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/Debian/release", "Host/Debian/dpkg-l");

  exit(0);
}


include("audit.inc");
include("debian_package.inc");


if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
if (!get_kb_item("Host/Debian/release")) audit(AUDIT_OS_NOT, "Debian");
if (!get_kb_item("Host/Debian/dpkg-l")) audit(AUDIT_PACKAGE_LIST_MISSING);


flag = 0;
if (deb_check(release:"4.0", prefix:"xen-docs-3.0", reference:"3.0.3-0-4")) flag++;
if (deb_check(release:"4.0", prefix:"xen-hypervisor-3.0.3-1-amd64", reference:"3.0.3-0-4")) flag++;
if (deb_check(release:"4.0", prefix:"xen-hypervisor-3.0.3-1-i386", reference:"3.0.3-0-4")) flag++;
if (deb_check(release:"4.0", prefix:"xen-hypervisor-3.0.3-1-i386-pae", reference:"3.0.3-0-4")) flag++;
if (deb_check(release:"4.0", prefix:"xen-ioemu-3.0.3-1", reference:"3.0.3-0-4")) flag++;
if (deb_check(release:"4.0", prefix:"xen-utils-3.0.3-1", reference:"3.0.3-0-4")) flag++;

if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:deb_report_get());
  else security_warning(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");