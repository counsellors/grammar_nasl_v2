#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Red Hat Security Advisory RHSA-2008:0576 and 
# CentOS Errata and Security Advisory 2008:0576 respectively.
#

include("compat.inc");

if (description)
{
  script_id(33735);
  script_version("$Revision: 1.9 $");
  script_cvs_date("$Date: 2015/05/19 23:34:19 $");

  script_cve_id("CVE-2008-1801");
  script_bugtraq_id(29097);
  script_osvdb_id(44943);
  script_xref(name:"RHSA", value:"2008:0576");

  script_name(english:"CentOS 3 : rdesktop (CESA-2008:0576)");
  script_summary(english:"Checks rpm output for the updated package");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote CentOS host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Updated rdesktop packages that fix a security issues are now available
for Red Hat Enterprise Linux 3.

This update has been rated as having moderate security impact by the
Red Hat Security Response Team.

rdesktop is an open source client for Microsoft Windows NT Terminal
Server and Microsoft Windows 2000 and 2003 Terminal Services, capable
of natively using the Remote Desktop Protocol (RDP) to present the
user's NT desktop. No additional server extensions are required.

An integer underflow vulnerability was discovered in the rdesktop. If
an attacker could convince a victim to connect to a malicious RDP
server, the attacker could cause the victim's rdesktop to crash or,
possibly, execute an arbitrary code. (CVE-2008-1801)

Users of rdesktop should upgrade to these updated packages, which
contain a backported patch to resolve this issue."
  );
  # http://lists.centos.org/pipermail/centos-announce/2008-July/015163.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?8b5b67cf"
  );
  # http://lists.centos.org/pipermail/centos-announce/2008-July/015164.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?207ad699"
  );
  # http://lists.centos.org/pipermail/centos-announce/2008-July/015169.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?061f9456"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected rdesktop package."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:POC/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");
  script_cwe_id(189);

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:rdesktop");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:3");

  script_set_attribute(attribute:"patch_publication_date", value:"2008/07/26");
  script_set_attribute(attribute:"plugin_publication_date", value:"2008/07/28");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2008-2015 Tenable Network Security, Inc.");
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
if (rpm_check(release:"CentOS-3", reference:"rdesktop-1.2.0-3")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:rpm_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");