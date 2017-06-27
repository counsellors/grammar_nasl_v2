#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Mandriva Linux Security Advisory MDVSA-2009:206. 
# The text itself is copyright (C) Mandriva S.A.
#

include("compat.inc");

if (description)
{
  script_id(40638);
  script_version("$Revision: 1.16 $");
  script_cvs_date("$Date: 2016/05/17 17:02:54 $");

  script_cve_id("CVE-2009-3490");
  script_bugtraq_id(36205);
  script_xref(name:"MDVSA", value:"2009:206-1");

  script_name(english:"Mandriva Linux Security Advisory : wget (MDVSA-2009:206-1)");
  script_summary(english:"Checks rpm output for the updated package");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Mandriva Linux host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"A vulnerability has been found and corrected in wget :

GNU Wget before 1.12 does not properly handle a '&#0;' (NUL) character
in a domain name in the Common Name field of an X.509 certificate,
which allows man-in-the-middle remote attackers to spoof arbitrary SSL
servers via a crafted certificate issued by a legitimate Certification
Authority, a related issue to CVE-2009-2408 (CVE-2009-3490).

This update provides a solution to this vulnerability.

Update :

Packages for 2008.0 are provided for Corporate Desktop 2008.0
customers"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected wget package.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_set_cvss_temporal_vector("CVSS2#E:ND/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");
  script_cwe_id(310);

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:wget");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:mandriva:linux:2008.0");

  script_set_attribute(attribute:"patch_publication_date", value:"2009/12/04");
  script_set_attribute(attribute:"plugin_publication_date", value:"2009/08/20");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2009-2016 Tenable Network Security, Inc.");
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
if (rpm_check(release:"MDK2008.0", reference:"wget-1.10.2-6.1mdv2008.0", yank:"mdv")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:rpm_report_get());
  else security_warning(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");