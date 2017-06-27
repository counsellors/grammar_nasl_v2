#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Debian Security Advisory DSA-3690. The text 
# itself is copyright (C) Software in the Public Interest, Inc.
#

include("compat.inc");

if (description)
{
  script_id(93941);
  script_version("$Revision: 2.5 $");
  script_cvs_date("$Date: 2016/12/06 20:34:49 $");

  script_cve_id("CVE-2016-5257");
  script_osvdb_id(144614, 144615, 144616, 144617, 144618, 144619, 144620, 144621, 144623);
  script_xref(name:"DSA", value:"3690");

  script_name(english:"Debian DSA-3690-1 : icedove - security update");
  script_summary(english:"Checks dpkg output for the updated package");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Debian host is missing a security-related update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Multiple security issues have been found in Icedove, Debian's version
of the Mozilla Thunderbird mail client: Multiple memory safety errors
may lead to the execution of arbitrary code or denial of service."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://packages.debian.org/source/jessie/icedove"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.debian.org/security/2016/dsa-3690"
  );
  script_set_attribute(
    attribute:"solution", 
    value:
"Upgrade the icedove packages.

For the stable distribution (jessie), this problem has been fixed in
version 1:45.4.0-1~deb8u1."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_set_cvss_temporal_vector("CVSS2#E:U/RL:OF/RC:C");
  script_set_cvss3_base_vector("CVSS:3.0/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H");
  script_set_attribute(attribute:"exploitability_ease", value:"No known exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"false");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:debian:debian_linux:icedove");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:debian:debian_linux:8.0");

  script_set_attribute(attribute:"patch_publication_date", value:"2016/10/10");
  script_set_attribute(attribute:"plugin_publication_date", value:"2016/10/11");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2016 Tenable Network Security, Inc.");
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
if (deb_check(release:"8.0", prefix:"calendar-google-provider", reference:"1:45.4.0-1~deb8u1")) flag++;
if (deb_check(release:"8.0", prefix:"icedove", reference:"1:45.4.0-1~deb8u1")) flag++;
if (deb_check(release:"8.0", prefix:"icedove-dbg", reference:"1:45.4.0-1~deb8u1")) flag++;
if (deb_check(release:"8.0", prefix:"icedove-dev", reference:"1:45.4.0-1~deb8u1")) flag++;
if (deb_check(release:"8.0", prefix:"iceowl-extension", reference:"1:45.4.0-1~deb8u1")) flag++;

if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:deb_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");