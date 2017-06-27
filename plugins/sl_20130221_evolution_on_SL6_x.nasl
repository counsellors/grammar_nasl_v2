#
# (C) Tenable Network Security, Inc.
#
# The descriptive text is (C) Scientific Linux.
#

include("compat.inc");

if (description)
{
  script_id(65010);
  script_version("$Revision: 1.4 $");
  script_cvs_date("$Date: 2013/03/19 11:03:15 $");

  script_cve_id("CVE-2011-3201");

  script_name(english:"Scientific Linux Security Update : evolution on SL6.x i386/x86_64");
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
"The way Evolution handled mailto URLs allowed any file to be attached
to the new message. This could lead to information disclosure if the
user did not notice the attached file before sending the message. With
this update, mailto URLs cannot be used to attach certain files, such
as hidden files or files in hidden directories, files in the /etc/
directory, or files specified using a path containing '..'.
(CVE-2011-3201)

This update also fixes the following bugs :

  - Creating a contact list with contact names encoded in
    UTF-8 caused these names to be displayed in the contact
    list editor in the ASCII encoding instead of UTF-8. This
    bug has been fixed and the contact list editor now
    displays the names in the correct format.

  - Due to a bug in the evolution-alarm-notify process,
    calendar appointment alarms did not appear in some types
    of calendars. The underlying source code has been
    modified and calendar notifications work as expected.

  - An attempt to print a calendar month view as a PDF file
    caused Evolution to terminate unexpectedly. This update
    applies a patch to fix this bug and Evolution no longer
    crashes in this situation.

All running instances of Evolution must be restarted for this update
to take effect."
  );
  # http://listserv.fnal.gov/scripts/wa.exe?A2=ind1303&L=scientific-linux-errata&T=0&P=696
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?b0972e96"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected packages.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:P/I:N/A:N");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"x-cpe:/o:fermilab:scientific_linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2013/02/21");
  script_set_attribute(attribute:"plugin_publication_date", value:"2013/03/05");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2013 Tenable Network Security, Inc.");
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
if (rpm_check(release:"SL6", reference:"evolution-2.28.3-30.el6")) flag++;
if (rpm_check(release:"SL6", reference:"evolution-conduits-2.28.3-30.el6")) flag++;
if (rpm_check(release:"SL6", reference:"evolution-debuginfo-2.28.3-30.el6")) flag++;
if (rpm_check(release:"SL6", reference:"evolution-devel-2.28.3-30.el6")) flag++;
if (rpm_check(release:"SL6", reference:"evolution-help-2.28.3-30.el6")) flag++;
if (rpm_check(release:"SL6", reference:"evolution-perl-2.28.3-30.el6")) flag++;
if (rpm_check(release:"SL6", reference:"evolution-pst-2.28.3-30.el6")) flag++;
if (rpm_check(release:"SL6", reference:"evolution-spamassassin-2.28.3-30.el6")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:rpm_report_get());
  else security_warning(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");