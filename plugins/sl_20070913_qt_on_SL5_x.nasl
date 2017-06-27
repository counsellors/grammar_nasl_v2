#
# (C) Tenable Network Security, Inc.
#
# The descriptive text is (C) Scientific Linux.
#

include("compat.inc");

if (description)
{
  script_id(60250);
  script_version("$Revision: 1.1 $");
  script_cvs_date("$Date: 2012/08/01 14:38:52 $");

  script_cve_id("CVE-2007-0242", "CVE-2007-4137");

  script_name(english:"Scientific Linux Security Update : qt on SL5.x, SL4.x, SL3.x i386/x86_64");
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
"A flaw was found in the way Qt expanded certain UTF8 characters. It
was possible to prevent a Qt-based application from properly
sanitizing user supplied input. This could, for example, result in a
cross-site scripting attack against the Konqueror web browser.
(CVE-2007-0242)

A buffer overflow flaw was found in the way Qt expanded malformed
Unicode strings. If an application linked against Qt parsed a
malicious Unicode string, it could lead to a denial of service or
possibly allow the execution of arbitrary code. (CVE-2007-4137)"
  );
  # http://listserv.fnal.gov/scripts/wa.exe?A2=ind0709&L=scientific-linux-errata&T=0&P=784
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?2a7ba8f4"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected packages.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_cwe_id(119);

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"x-cpe:/o:fermilab:scientific_linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2007/09/13");
  script_set_attribute(attribute:"plugin_publication_date", value:"2012/08/01");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2012 Tenable Network Security, Inc.");
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
if (rpm_check(release:"SL3", reference:"qt-3.1.2-17.RHEL3")) flag++;
if (rpm_check(release:"SL3", reference:"qt-MySQL-3.1.2-17.RHEL3")) flag++;
if (rpm_check(release:"SL3", reference:"qt-ODBC-3.1.2-17.RHEL3")) flag++;
if (rpm_check(release:"SL3", reference:"qt-PostgreSQL-3.1.2-17.RHEL3")) flag++;
if (rpm_check(release:"SL3", reference:"qt-config-3.1.2-17.RHEL3")) flag++;
if (rpm_check(release:"SL3", reference:"qt-designer-3.1.2-17.RHEL3")) flag++;
if (rpm_check(release:"SL3", reference:"qt-devel-3.1.2-17.RHEL3")) flag++;

if (rpm_check(release:"SL4", reference:"qt-3.3.3-13.RHEL4")) flag++;
if (rpm_check(release:"SL4", reference:"qt-MySQL-3.3.3-13.RHEL4")) flag++;
if (rpm_check(release:"SL4", reference:"qt-ODBC-3.3.3-13.RHEL4")) flag++;
if (rpm_check(release:"SL4", reference:"qt-PostgreSQL-3.3.3-13.RHEL4")) flag++;
if (rpm_check(release:"SL4", reference:"qt-config-3.3.3-13.RHEL4")) flag++;
if (rpm_check(release:"SL4", reference:"qt-designer-3.3.3-13.RHEL4")) flag++;
if (rpm_check(release:"SL4", reference:"qt-devel-3.3.3-13.RHEL4")) flag++;

if (rpm_check(release:"SL5", reference:"qt-3.3.6-23.el5")) flag++;
if (rpm_check(release:"SL5", reference:"qt-MySQL-3.3.6-23.el5")) flag++;
if (rpm_check(release:"SL5", reference:"qt-ODBC-3.3.6-23.el5")) flag++;
if (rpm_check(release:"SL5", reference:"qt-PostgreSQL-3.3.6-23.el5")) flag++;
if (rpm_check(release:"SL5", reference:"qt-config-3.3.6-23.el5")) flag++;
if (rpm_check(release:"SL5", reference:"qt-designer-3.3.6-23.el5")) flag++;
if (rpm_check(release:"SL5", reference:"qt-devel-3.3.6-23.el5")) flag++;
if (rpm_check(release:"SL5", reference:"qt-devel-docs-3.3.6-23.el5")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:rpm_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");