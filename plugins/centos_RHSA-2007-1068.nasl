#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Red Hat Security Advisory RHSA-2007:1068 and 
# CentOS Errata and Security Advisory 2007:1068 respectively.
#

include("compat.inc");

if (description)
{
  script_id(67061);
  script_version("$Revision: 1.4 $");
  script_cvs_date("$Date: 2016/11/17 20:59:08 $");

  script_cve_id("CVE-2006-7225", "CVE-2006-7226", "CVE-2006-7228", "CVE-2006-7230", "CVE-2007-1659");
  script_bugtraq_id(26462, 26550, 26725);
  script_osvdb_id(40753, 40754, 40755, 40756, 40757, 40758, 40763);
  script_xref(name:"RHSA", value:"2007:1068");

  script_name(english:"CentOS 4 : pcre (CESA-2007:1068)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote CentOS host is missing one or more security updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Updated pcre packages that resolve several security issues are now
available for Red Hat Enterprise Linux 4.

This update has been rated as having important security impact by the
Red Hat Security Response Team.

PCRE is a Perl-compatible regular expression library.

Flaws were discovered in the way PCRE handles certain malformed
regular expressions. If an application linked against PCRE, such as
Konqueror, parses a malicious regular expression, it may have been
possible to run arbitrary code as the user running the application.
(CVE-2006-7225, CVE-2006-7226, CVE-2006-7228, CVE-2006-7230,
CVE-2007-1659)

Users of PCRE are advised to upgrade to these updated packages, which
contain backported patches to resolve these issues.

Red Hat would like to thank Ludwig Nussel for reporting these issues."
  );
  # http://lists.centos.org/pipermail/centos-announce/2007-November/014466.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?9153dfc5"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected pcre packages.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_set_cvss_temporal_vector("CVSS2#E:ND/RL:ND/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"No known exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"false");
  script_cwe_id(20, 119, 189);

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:pcre");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:pcre-devel");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:4");

  script_set_attribute(attribute:"patch_publication_date", value:"2007/11/29");
  script_set_attribute(attribute:"plugin_publication_date", value:"2013/06/29");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2013-2016 Tenable Network Security, Inc.");
  script_family(english:"CentOS Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/CentOS/release", "Host/CentOS/rpm-list");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("rpm.inc");


if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
if (!get_kb_item("Host/CentOS/release")) audit(AUDIT_OS_NOT, "CentOS");
if (!get_kb_item("Host/CentOS/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);


cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && "ia64" >!< cpu && cpu !~ "^i[3-6]86$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "CentOS", cpu);


flag = 0;
if (rpm_check(release:"CentOS-4", cpu:"ia64", reference:"pcre-4.5-4.c4.6")) flag++;
if (rpm_check(release:"CentOS-4", cpu:"ia64", reference:"pcre-devel-4.5-4.c4.6")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:rpm_report_get());
  else security_warning(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");