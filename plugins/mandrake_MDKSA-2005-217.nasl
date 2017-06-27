#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Mandrake Linux Security Advisory MDKSA-2005:217. 
# The text itself is copyright (C) Mandriva S.A.
#

include("compat.inc");

if (description)
{
  script_id(20449);
  script_version ("$Revision: 1.14 $");
  script_cvs_date("$Date: 2015/03/19 14:42:14 $");

  script_cve_id("CVE-2005-3632", "CVE-2005-3662");
  script_bugtraq_id(15427, 15514);
  script_xref(name:"MDKSA", value:"2005:217");

  script_name(english:"Mandrake Linux Security Advisory : netpbm (MDKSA-2005:217)");
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
"Greg Roelofs discovered and fixed several buffer overflows in pnmtopng
which is also included in netpbm, a collection of graphic conversion
utilities, that can lead to the execution of arbitrary code via a
specially crafted PNM file.

Multiple buffer overflows in pnmtopng in netpbm 10.0 and earlier allow
attackers to execute arbitrary code via a crafted PNM file.
(CVE-2005-3632)

An off-by-one buffer overflow in pnmtopng, when using the -alpha
command line option, allows attackers to cause a denial of service
(crash) and possibly execute arbitrary code via a crafted PNM file
with exactly 256 colors. (CVE-2005-3662)

The updated packages have been patched to correct this problem."
  );
  script_set_attribute(attribute:"solution", value:"Update the affected packages.");
  script_set_cvss_base_vector("CVSS2#AV:L/AC:L/Au:N/C:P/I:P/A:P");
  script_set_cvss_temporal_vector("CVSS2#E:ND/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"No known exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"false");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:lib64netpbm9");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:lib64netpbm9-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:lib64netpbm9-static-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:libnetpbm9");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:libnetpbm9-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:libnetpbm9-static-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:netpbm");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:mandrakesoft:mandrake_linux:10.1");

  script_set_attribute(attribute:"patch_publication_date", value:"2005/11/30");
  script_set_attribute(attribute:"plugin_publication_date", value:"2006/01/15");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2006-2015 Tenable Network Security, Inc.");
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
if (rpm_check(release:"MDK10.1", cpu:"x86_64", reference:"lib64netpbm9-9.24-8.2.101mdk", yank:"mdk")) flag++;
if (rpm_check(release:"MDK10.1", cpu:"x86_64", reference:"lib64netpbm9-devel-9.24-8.2.101mdk", yank:"mdk")) flag++;
if (rpm_check(release:"MDK10.1", cpu:"x86_64", reference:"lib64netpbm9-static-devel-9.24-8.2.101mdk", yank:"mdk")) flag++;
if (rpm_check(release:"MDK10.1", cpu:"i386", reference:"libnetpbm9-9.24-8.2.101mdk", yank:"mdk")) flag++;
if (rpm_check(release:"MDK10.1", cpu:"i386", reference:"libnetpbm9-devel-9.24-8.2.101mdk", yank:"mdk")) flag++;
if (rpm_check(release:"MDK10.1", cpu:"i386", reference:"libnetpbm9-static-devel-9.24-8.2.101mdk", yank:"mdk")) flag++;
if (rpm_check(release:"MDK10.1", reference:"netpbm-9.24-8.2.101mdk", yank:"mdk")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:rpm_report_get());
  else security_warning(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");