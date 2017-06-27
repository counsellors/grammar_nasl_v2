#
# (C) Tenable Network Security, Inc.
#
# The descriptive text is (C) Scientific Linux.
#

include("compat.inc");

if (description)
{
  script_id(83452);
  script_version("$Revision: 2.2 $");
  script_cvs_date("$Date: 2015/05/21 17:15:51 $");

  script_cve_id("CVE-2015-0267");

  script_name(english:"Scientific Linux Security Update : kexec-tools on SL7.x x86_64");
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
"It was found that the module-setup.sh script provided by kexec-tools
created temporary files in an insecure way. A malicious, local user
could use this flaw to conduct a symbolic link attack, allowing them
to overwrite the contents of arbitrary files. (CVE-2015-0267)

This update also fixes the following bug :

  - On Atomic Host systems, the kdump tool previously saved
    kernel crash dumps in the /sysroot/crash file instead of
    the /var/crash file. The parsing error that caused this
    problem has been fixed, and the kernel crash dumps are
    now correctly saved in /var/crash.

In addition, this update adds the following enhancement :

  - The makedumpfile command now supports the new sadump
    format that can represent more than 16 TB of physical
    memory space. This allows users of makedumpfile to read
    dump files over 16 TB, generated by sadump on certain
    upcoming server models."
  );
  # http://listserv.fnal.gov/scripts/wa.exe?A2=ind1505&L=scientific-linux-errata&T=0&P=1122
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?56c42f79"
  );
  script_set_attribute(
    attribute:"solution", 
    value:
"Update the affected kexec-tools, kexec-tools-debuginfo and / or
kexec-tools-eppic packages."
  );
  script_set_cvss_base_vector("CVSS2#AV:L/AC:L/Au:N/C:N/I:P/A:P");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"x-cpe:/o:fermilab:scientific_linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2015/05/12");
  script_set_attribute(attribute:"plugin_publication_date", value:"2015/05/14");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2015 Tenable Network Security, Inc.");
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
if (rpm_check(release:"SL7", cpu:"x86_64", reference:"kexec-tools-2.0.7-19.el7_1.2")) flag++;
if (rpm_check(release:"SL7", cpu:"x86_64", reference:"kexec-tools-debuginfo-2.0.7-19.el7_1.2")) flag++;
if (rpm_check(release:"SL7", cpu:"x86_64", reference:"kexec-tools-eppic-2.0.7-19.el7_1.2")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_note(port:0, extra:rpm_report_get());
  else security_note(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");