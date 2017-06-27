#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Mandrake Linux Security Advisory MDKSA-2005:038. 
# The text itself is copyright (C) Mandriva S.A.
#

include("compat.inc");

if (description)
{
  script_id(16473);
  script_version ("$Revision: 1.15 $");
  script_cvs_date("$Date: 2013/05/31 23:51:56 $");

  script_cve_id("CVE-2005-0100");
  script_xref(name:"MDKSA", value:"2005:038");

  script_name(english:"Mandrake Linux Security Advisory : emacs (MDKSA-2005:038)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:
"The remote Mandrake Linux host is missing one or more security
updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Max Vozeler discovered several format string vulnerabilities in the
movemail utility in Emacs. If a user connects to a malicious POP
server, an attacker can execute arbitrary code as the user running
emacs.

The updated packages have been patched to correct the problem."
  );
  script_set_attribute(attribute:"solution", value:"Update the affected packages.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:emacs");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:emacs-X11");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:emacs-doc");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:emacs-el");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:emacs-leim");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:emacs-nox");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:xemacs");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:xemacs-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:xemacs-el");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:xemacs-extras");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:xemacs-packages");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:mandrakesoft:mandrake_linux:10.0");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:mandrakesoft:mandrake_linux:10.1");

  script_set_attribute(attribute:"patch_publication_date", value:"2005/02/15");
  script_set_attribute(attribute:"plugin_publication_date", value:"2005/02/16");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2005-2013 Tenable Network Security, Inc.");
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
if (rpm_check(release:"MDK10.0", reference:"emacs-21.3-9.1.100mdk", yank:"mdk")) flag++;
if (rpm_check(release:"MDK10.0", reference:"emacs-X11-21.3-9.1.100mdk", yank:"mdk")) flag++;
if (rpm_check(release:"MDK10.0", reference:"emacs-el-21.3-9.1.100mdk", yank:"mdk")) flag++;
if (rpm_check(release:"MDK10.0", reference:"emacs-leim-21.3-9.1.100mdk", yank:"mdk")) flag++;
if (rpm_check(release:"MDK10.0", reference:"emacs-nox-21.3-9.1.100mdk", yank:"mdk")) flag++;
if (rpm_check(release:"MDK10.0", reference:"xemacs-21.4.15-5.1.100mdk", yank:"mdk")) flag++;
if (rpm_check(release:"MDK10.0", reference:"xemacs-devel-21.4.15-5.1.100mdk", yank:"mdk")) flag++;
if (rpm_check(release:"MDK10.0", reference:"xemacs-el-21.4.15-5.1.100mdk", yank:"mdk")) flag++;
if (rpm_check(release:"MDK10.0", reference:"xemacs-extras-21.4.15-5.1.100mdk", yank:"mdk")) flag++;
if (rpm_check(release:"MDK10.0", reference:"xemacs-packages-21.4.15-5.1.100mdk", yank:"mdk")) flag++;

if (rpm_check(release:"MDK10.1", reference:"emacs-21.3-15.1.101mdk", yank:"mdk")) flag++;
if (rpm_check(release:"MDK10.1", reference:"emacs-X11-21.3-15.1.101mdk", yank:"mdk")) flag++;
if (rpm_check(release:"MDK10.1", reference:"emacs-doc-21.3-15.1.101mdk", yank:"mdk")) flag++;
if (rpm_check(release:"MDK10.1", reference:"emacs-el-21.3-15.1.101mdk", yank:"mdk")) flag++;
if (rpm_check(release:"MDK10.1", reference:"emacs-leim-21.3-15.1.101mdk", yank:"mdk")) flag++;
if (rpm_check(release:"MDK10.1", reference:"emacs-nox-21.3-15.1.101mdk", yank:"mdk")) flag++;
if (rpm_check(release:"MDK10.1", reference:"xemacs-21.4.15-5.1.101mdk", yank:"mdk")) flag++;
if (rpm_check(release:"MDK10.1", reference:"xemacs-devel-21.4.15-5.1.101mdk", yank:"mdk")) flag++;
if (rpm_check(release:"MDK10.1", reference:"xemacs-el-21.4.15-5.1.101mdk", yank:"mdk")) flag++;
if (rpm_check(release:"MDK10.1", reference:"xemacs-extras-21.4.15-5.1.101mdk", yank:"mdk")) flag++;
if (rpm_check(release:"MDK10.1", reference:"xemacs-packages-21.4.15-5.1.101mdk", yank:"mdk")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:rpm_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");