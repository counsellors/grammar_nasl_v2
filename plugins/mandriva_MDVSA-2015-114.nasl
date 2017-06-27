#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Mandriva Linux Security Advisory MDVSA-2015:114. 
# The text itself is copyright (C) Mandriva S.A.
#

include("compat.inc");

if (description)
{
  script_id(82367);
  script_version("$Revision: 1.2 $");
  script_cvs_date("$Date: 2015/04/02 13:36:27 $");

  script_cve_id("CVE-2014-2830");
  script_xref(name:"MDVSA", value:"2015:114");

  script_name(english:"Mandriva Linux Security Advisory : cifs-utils (MDVSA-2015:114)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:
"The remote Mandriva Linux host is missing one or more security
updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Updated cifs-utils packages fix security vulnerability :

Sebastian Krahmer discovered a stack-based buffer overflow flaw in
cifscreds.c (CVE-2014-2830)."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://advisories.mageia.org/MGASA-2014-0242.html"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected cifs-utils and / or cifs-utils-devel packages."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:cifs-utils");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:cifs-utils-devel");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:mandriva:business_server:2");

  script_set_attribute(attribute:"patch_publication_date", value:"2015/03/29");
  script_set_attribute(attribute:"plugin_publication_date", value:"2015/03/30");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2015 Tenable Network Security, Inc.");
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
if (rpm_check(release:"MDK-MBS2", cpu:"x86_64", reference:"cifs-utils-6.2-3.1.mbs2")) flag++;
if (rpm_check(release:"MDK-MBS2", cpu:"x86_64", reference:"cifs-utils-devel-6.2-3.1.mbs2")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:rpm_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");