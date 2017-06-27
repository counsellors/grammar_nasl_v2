#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Mandriva Linux Security Advisory MDVSA-2014:055. 
# The text itself is copyright (C) Mandriva S.A.
#

include("compat.inc");

if (description)
{
  script_id(73002);
  script_version("$Revision: 1.1 $");
  script_cvs_date("$Date: 2014/03/14 13:12:25 $");

  script_xref(name:"MDVSA", value:"2014:055");

  script_name(english:"Mandriva Linux Security Advisory : owncloud (MDVSA-2014:055)");
  script_summary(english:"Checks rpm output for the updated package");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Mandriva Linux host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Updated owncloud packages fix security vulnerabilities and bugs :

Owncloud versions 5.0.15 and 6.0.2 fix several unspecified security
vulnerabilities, as well as many other bugs.

See the upstream Changelog for more information."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://advisories.mageia.org/MGASA-2014-0120.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://owncloud.org/changelog/"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected owncloud package."
  );
  script_set_attribute(attribute:"risk_factor", value:"High");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:owncloud");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:mandriva:business_server:1");

  script_set_attribute(attribute:"patch_publication_date", value:"2014/03/13");
  script_set_attribute(attribute:"plugin_publication_date", value:"2014/03/14");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2014 Tenable Network Security, Inc.");
  script_family(english:"Mandriva Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/cpu", "Host/Mandrake/release", "Host/Mandrake/rpm-list");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("rpm.inc");


if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
if (!get_kb_item("Host/Mandrake/release")) audit(AUDIT_OS_NOT, "Mandriva / Mandake Linux");
if (!get_kb_item("Host/Mandrake/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if (cpu !~ "^(amd64|i[3-6]86|x86_64)$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Mandriva / Mandrake Linux", cpu);


flag = 0;
if (rpm_check(release:"MDK-MBS1", reference:"owncloud-5.0.15-1.mbs1")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:rpm_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");