#
# (C) Tenable Network Security, Inc.
#
# The descriptive text is (C) Scientific Linux.
#

include("compat.inc");

if (description)
{
  script_id(61295);
  script_version("$Revision: 1.2 $");
  script_cvs_date("$Date: 2014/08/16 19:47:27 $");

  script_cve_id("CVE-2012-1126", "CVE-2012-1127", "CVE-2012-1130", "CVE-2012-1131", "CVE-2012-1132", "CVE-2012-1134", "CVE-2012-1136", "CVE-2012-1137", "CVE-2012-1139", "CVE-2012-1140", "CVE-2012-1141", "CVE-2012-1142", "CVE-2012-1143", "CVE-2012-1144");

  script_name(english:"Scientific Linux Security Update : freetype on SL5.x, SL6.x i386/x86_64");
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
"FreeType is a free, high-quality, portable font engine that can open
and manage font files. It also loads, hints, and renders individual
glyphs efficiently.

Multiple flaws were found in the way FreeType handled TrueType Font
(TTF), Glyph Bitmap Distribution Format (BDF), Windows .fnt and .fon,
and PostScript Type 1 fonts. If a specially crafted font file was
loaded by an application linked against FreeType, it could cause the
application to crash or, potentially, execute arbitrary code with the
privileges of the user running the application. (CVE-2012-1134,
CVE-2012-1136, CVE-2012-1142, CVE-2012-1144)

Multiple flaws were found in the way FreeType handled fonts in various
formats. If a specially crafted font file was loaded by an application
linked against FreeType, it could cause the application to crash.
(CVE-2012-1126, CVE-2012-1127, CVE-2012-1130, CVE-2012-1131,
CVE-2012-1132, CVE-2012-1137, CVE-2012-1139, CVE-2012-1140,
CVE-2012-1141, CVE-2012-1143)

Users are advised to upgrade to these updated packages, which contain
a backported patch to correct these issues. The X server must be
restarted (log out, then log back in) for this update to take effect."
  );
  # http://listserv.fnal.gov/scripts/wa.exe?A2=ind1204&L=scientific-linux-errata&T=0&P=695
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?e2731dc1"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected packages.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"x-cpe:/o:fermilab:scientific_linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2012/04/10");
  script_set_attribute(attribute:"plugin_publication_date", value:"2012/08/01");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2012-2014 Tenable Network Security, Inc.");
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
if (rpm_check(release:"SL5", reference:"freetype-2.2.1-31.el5_8.1")) flag++;
if (rpm_check(release:"SL5", reference:"freetype-debuginfo-2.2.1-31.el5_8.1")) flag++;
if (rpm_check(release:"SL5", reference:"freetype-demos-2.2.1-31.el5_8.1")) flag++;
if (rpm_check(release:"SL5", reference:"freetype-devel-2.2.1-31.el5_8.1")) flag++;

if (rpm_check(release:"SL6", reference:"freetype-2.3.11-6.el6_2.9")) flag++;
if (rpm_check(release:"SL6", reference:"freetype-debuginfo-2.3.11-6.el6_2.9")) flag++;
if (rpm_check(release:"SL6", reference:"freetype-demos-2.3.11-6.el6_2.9")) flag++;
if (rpm_check(release:"SL6", reference:"freetype-devel-2.3.11-6.el6_2.9")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:rpm_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");