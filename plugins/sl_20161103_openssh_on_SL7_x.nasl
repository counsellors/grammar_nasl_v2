#
# (C) Tenable Network Security, Inc.
#
# The descriptive text is (C) Scientific Linux.
#

include("compat.inc");

if (description)
{
  script_id(95851);
  script_version("$Revision: 3.1 $");
  script_cvs_date("$Date: 2016/12/15 14:46:41 $");

  script_cve_id("CVE-2015-8325");

  script_name(english:"Scientific Linux Security Update : openssh on SL7.x x86_64");
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
"Security Fix(es) :

  - It was discovered that the OpenSSH sshd daemon fetched
    PAM environment settings before running the login
    program. In configurations with UseLogin=yes and the
    pam_env PAM module configured to read user environment
    settings, a local user could use this flaw to execute
    arbitrary code as root. (CVE-2015-8325)

Additional Changes :"
  );
  # http://listserv.fnal.gov/scripts/wa.exe?A2=ind1612&L=scientific-linux-errata&F=&S=&P=11841
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?c95d9da8"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected packages.");
  script_set_cvss_base_vector("CVSS2#AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_set_cvss3_base_vector("CVSS:3.0/AV:L/AC:L/PR:L/UI:N/S:U/C:H/I:H/A:H");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"x-cpe:/o:fermilab:scientific_linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2016/11/03");
  script_set_attribute(attribute:"plugin_publication_date", value:"2016/12/15");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2016 Tenable Network Security, Inc.");
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
if (rpm_check(release:"SL7", cpu:"x86_64", reference:"openssh-6.6.1p1-31.el7")) flag++;
if (rpm_check(release:"SL7", cpu:"x86_64", reference:"openssh-askpass-6.6.1p1-31.el7")) flag++;
if (rpm_check(release:"SL7", cpu:"x86_64", reference:"openssh-clients-6.6.1p1-31.el7")) flag++;
if (rpm_check(release:"SL7", cpu:"x86_64", reference:"openssh-debuginfo-6.6.1p1-31.el7")) flag++;
if (rpm_check(release:"SL7", cpu:"x86_64", reference:"openssh-keycat-6.6.1p1-31.el7")) flag++;
if (rpm_check(release:"SL7", cpu:"x86_64", reference:"openssh-ldap-6.6.1p1-31.el7")) flag++;
if (rpm_check(release:"SL7", cpu:"x86_64", reference:"openssh-server-6.6.1p1-31.el7")) flag++;
if (rpm_check(release:"SL7", cpu:"x86_64", reference:"openssh-server-sysvinit-6.6.1p1-31.el7")) flag++;
if (rpm_check(release:"SL7", cpu:"x86_64", reference:"pam_ssh_agent_auth-0.9.3-9.31.el7")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:rpm_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");