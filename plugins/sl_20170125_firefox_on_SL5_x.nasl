#
# (C) Tenable Network Security, Inc.
#
# The descriptive text is (C) Scientific Linux.
#

if (NASL_LEVEL < 3000) exit(0);

include("compat.inc");

if (description)
{
  script_id(96792);
  script_version("$Revision: 3.3 $");
  script_cvs_date("$Date: 2017/03/15 21:22:53 $");

  script_cve_id("CVE-2017-5373", "CVE-2017-5375", "CVE-2017-5376", "CVE-2017-5378", "CVE-2017-5380", "CVE-2017-5383", "CVE-2017-5386", "CVE-2017-5390", "CVE-2017-5396");

  script_name(english:"Scientific Linux Security Update : firefox on SL5.x, SL6.x, SL7.x i386/x86_64");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:
"The remote Scientific Linux host is missing one or more security
updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"This update upgrades Firefox to version 45.7.0 ESR.

Security Fix(es) :

  - Multiple flaws were found in the processing of malformed
    web content. A web page containing malicious content
    could cause Firefox to crash or, potentially, execute
    arbitrary code with the privileges of the user running
    Firefox. (CVE-2017-5373, CVE-2017-5375, CVE-2017-5376,
    CVE-2017-5378, CVE-2017-5380, CVE-2017-5383,
    CVE-2017-5386, CVE-2017-5390, CVE-2017-5396)"
  );
  # http://listserv.fnal.gov/scripts/wa.exe?A2=ind1701&L=scientific-linux-errata&F=&S=&P=12036
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?98248eea"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected firefox and / or firefox-debuginfo packages."
  );
  script_set_attribute(attribute:"risk_factor", value:"High");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"x-cpe:/o:fermilab:scientific_linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2017/01/25");
  script_set_attribute(attribute:"plugin_publication_date", value:"2017/01/26");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2017 Tenable Network Security, Inc.");
  script_family(english:"Scientific Linux Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/cpu", "Host/RedHat/release", "Host/RedHat/rpm-list");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("rpm.inc");


if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
release = get_kb_item("Host/RedHat/release");
if (isnull(release) || "Scientific Linux " >!< release) audit(AUDIT_HOST_NOT, "running Scientific Linux");
if (!get_kb_item("Host/RedHat/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if (cpu >!< "x86_64" && cpu !~ "^i[3-6]86$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Scientific Linux", cpu);


flag = 0;
if (rpm_check(release:"SL5", reference:"firefox-45.7.0-1.el5_11")) flag++;
if (rpm_check(release:"SL5", reference:"firefox-debuginfo-45.7.0-1.el5_11")) flag++;

if (rpm_check(release:"SL6", reference:"firefox-45.7.0-1.el6_8")) flag++;
if (rpm_check(release:"SL6", reference:"firefox-debuginfo-45.7.0-1.el6_8")) flag++;

if (rpm_check(release:"SL7", cpu:"x86_64", reference:"firefox-45.7.0-1.el7_3")) flag++;
if (rpm_check(release:"SL7", cpu:"x86_64", reference:"firefox-debuginfo-45.7.0-1.el7_3")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:rpm_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");