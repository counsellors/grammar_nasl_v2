#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Debian Security Advisory DSA-2042. The text 
# itself is copyright (C) Software in the Public Interest, Inc.
#

include("compat.inc");

if (description)
{
  script_id(46243);
  script_version("$Revision: 1.7 $");
  script_cvs_date("$Date: 2013/05/17 23:54:24 $");

  script_cve_id("CVE-2010-0743");
  script_bugtraq_id(39127);
  script_osvdb_id(63418);
  script_xref(name:"DSA", value:"2042");

  script_name(english:"Debian DSA-2042-1 : iscsitarget - format string");
  script_summary(english:"Checks dpkg output for the updated package");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Debian host is missing a security-related update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Florent Daigniere discovered multiple format string vulnerabilities in
Linux SCSI target framework (which is known as iscsitarget under
Debian) allow remote attackers to cause a denial of service in the
ietd daemon. The flaw could be trigger by sending a carefully-crafted
Internet Storage Name Service (iSNS) request."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=574935"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.debian.org/security/2010/dsa-2042"
  );
  script_set_attribute(
    attribute:"solution", 
    value:
"For the stable distribution (lenny), this problem has been fixed in
version 0.4.16+svn162-3.1+lenny1."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_set_cvss_temporal_vector("CVSS2#E:U/RL:OF/RC:ND");
  script_set_attribute(attribute:"exploitability_ease", value:"No known exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"false");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:debian:debian_linux:iscsitarget");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:debian:debian_linux:5.0");

  script_set_attribute(attribute:"patch_publication_date", value:"2010/05/05");
  script_set_attribute(attribute:"plugin_publication_date", value:"2010/05/07");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2010-2013 Tenable Network Security, Inc.");
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
if (deb_check(release:"5.0", prefix:"iscsitarget", reference:"0.4.16+svn162-3.1+lenny1")) flag++;
if (deb_check(release:"5.0", prefix:"iscsitarget-source", reference:"0.4.16+svn162-3.1+lenny1")) flag++;

if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:deb_report_get());
  else security_warning(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");