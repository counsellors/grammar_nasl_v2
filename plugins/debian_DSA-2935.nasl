#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Debian Security Advisory DSA-2935. The text 
# itself is copyright (C) Software in the Public Interest, Inc.
#

include("compat.inc");

if (description)
{
  script_id(74129);
  script_version("$Revision: 1.4 $");
  script_cvs_date("$Date: 2015/02/16 15:48:47 $");

  script_cve_id("CVE-2014-3775");
  script_bugtraq_id(67471);
  script_xref(name:"DSA", value:"2935");

  script_name(english:"Debian DSA-2935-1 : libgadu - security update");
  script_summary(english:"Checks dpkg output for the updated package");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Debian host is missing a security-related update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"It was discovered that malformed responses from a Gadu-Gadu file relay
server could lead to denial of service or the execution of arbitrary
code in applications linked to the libgadu library.

The oldstable distribution (squeeze) is not affected."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://packages.debian.org/source/wheezy/libgadu"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.debian.org/security/2014/dsa-2935"
  );
  script_set_attribute(
    attribute:"solution", 
    value:
"Upgrade the libgadu packages.

For the stable distribution (wheezy), this problem has been fixed in
version 1.11.2-1+deb7u2."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_set_cvss_temporal_vector("CVSS2#E:ND/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:debian:debian_linux:libgadu");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:debian:debian_linux:7.0");

  script_set_attribute(attribute:"patch_publication_date", value:"2014/05/21");
  script_set_attribute(attribute:"plugin_publication_date", value:"2014/05/22");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2014-2015 Tenable Network Security, Inc.");
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
if (deb_check(release:"7.0", prefix:"libgadu-dev", reference:"1.11.2-1+deb7u2")) flag++;
if (deb_check(release:"7.0", prefix:"libgadu-doc", reference:"1.11.2-1+deb7u2")) flag++;
if (deb_check(release:"7.0", prefix:"libgadu3", reference:"1.11.2-1+deb7u2")) flag++;
if (deb_check(release:"7.0", prefix:"libgadu3-dbg", reference:"1.11.2-1+deb7u2")) flag++;

if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:deb_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");