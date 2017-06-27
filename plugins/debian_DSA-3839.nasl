#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Debian Security Advisory DSA-3839. The text 
# itself is copyright (C) Software in the Public Interest, Inc.
#

include("compat.inc");

if (description)
{
  script_id(99742);
  script_version("$Revision: 3.2 $");
  script_cvs_date("$Date: 2017/05/05 13:31:48 $");

  script_cve_id("CVE-2016-10244", "CVE-2017-8105", "CVE-2017-8287");
  script_osvdb_id(143524, 156267, 156461);
  script_xref(name:"DSA", value:"3839");

  script_name(english:"Debian DSA-3839-1 : freetype - security update");
  script_summary(english:"Checks dpkg output for the updated package");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Debian host is missing a security-related update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Several vulnerabilities were discovered in Freetype. Opening malformed
fonts may result in denial of service or the execution of arbitrary
code."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=856971"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=861220"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=861308"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://packages.debian.org/source/jessie/freetype"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.debian.org/security/2017/dsa-3839"
  );
  script_set_attribute(
    attribute:"solution", 
    value:
"Upgrade the freetype packages.

For the stable distribution (jessie), these problems have been fixed
in version 2.5.2-3+deb8u2."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_set_cvss_temporal_vector("CVSS2#E:U/RL:OF/RC:C");
  script_set_cvss3_base_vector("CVSS:3.0/AV:L/AC:L/PR:N/UI:R/S:U/C:H/I:H/A:H");
  script_set_attribute(attribute:"exploitability_ease", value:"No known exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"false");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:debian:debian_linux:freetype");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:debian:debian_linux:8.0");

  script_set_attribute(attribute:"patch_publication_date", value:"2017/04/28");
  script_set_attribute(attribute:"plugin_publication_date", value:"2017/05/01");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2017 Tenable Network Security, Inc.");
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
if (deb_check(release:"8.0", prefix:"freetype2-demos", reference:"2.5.2-3+deb8u2")) flag++;
if (deb_check(release:"8.0", prefix:"libfreetype6", reference:"2.5.2-3+deb8u2")) flag++;
if (deb_check(release:"8.0", prefix:"libfreetype6-dev", reference:"2.5.2-3+deb8u2")) flag++;
if (deb_check(release:"8.0", prefix:"libfreetype6-udeb", reference:"2.5.2-3+deb8u2")) flag++;

if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:deb_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");