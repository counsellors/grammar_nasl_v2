#
# (C) Tenable Network Security, Inc.
#
# The descriptive text is (C) Scientific Linux.
#

include("compat.inc");

if (description)
{
  script_id(60219);
  script_version("$Revision: 1.4 $");
  script_cvs_date("$Date: 2014/06/05 10:49:46 $");

  script_cve_id("CVE-2007-2442", "CVE-2007-2443", "CVE-2007-2798");

  script_name(english:"Scientific Linux Security Update : krb5 on SL5.x, SL4.x, SL3.x i386/x86_64");
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
"David Coffey discovered an uninitialized pointer free flaw in the RPC
library used by kadmind. On Scientific Linux 4 and 5, glibc detects
attempts to free invalid pointers. A remote unauthenticated attacker
who can access kadmind could trigger this flaw and cause kadmind to
crash. (CVE-2007-2442)

David Coffey also discovered an overflow flaw in the RPC library used
by kadmind. On Scientific Linux, exploitation of this flaw is limited
to a denial of service. A remote unauthenticated attacker who can
access kadmind could trigger this flaw and cause kadmind to crash.
(CVE-2007-2443)

A stack-based buffer overflow flaw was found in kadmind. An
authenticated attacker who can access kadmind could trigger this flaw
and potentially execute arbitrary code on the Kerberos server.
(CVE-2007-2798)"
  );
  # http://listserv.fnal.gov/scripts/wa.exe?A2=ind0706&L=scientific-linux-errata&T=0&P=3913
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?8054bacf"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected packages.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_cwe_id(119);

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"x-cpe:/o:fermilab:scientific_linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2007/06/26");
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
if (rpm_check(release:"SL4", reference:"krb5-devel-1.3.4-49")) flag++;
if (rpm_check(release:"SL4", reference:"krb5-libs-1.3.4-49")) flag++;
if (rpm_check(release:"SL4", reference:"krb5-server-1.3.4-49")) flag++;
if (rpm_check(release:"SL4", reference:"krb5-workstation-1.3.4-49")) flag++;

if (rpm_check(release:"SL5", reference:"krb5-devel-1.5-26")) flag++;
if (rpm_check(release:"SL5", reference:"krb5-libs-1.5-26")) flag++;
if (rpm_check(release:"SL5", reference:"krb5-server-1.5-26")) flag++;
if (rpm_check(release:"SL5", reference:"krb5-workstation-1.5-26")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:rpm_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");