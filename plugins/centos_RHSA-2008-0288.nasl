#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Red Hat Security Advisory RHSA-2008:0288 and 
# CentOS Errata and Security Advisory 2008:0288 respectively.
#

include("compat.inc");

if (description)
{
  script_id(32456);
  script_version("$Revision: 1.10 $");
  script_cvs_date("$Date: 2015/05/19 23:34:18 $");

  script_cve_id("CVE-2008-1105");
  script_bugtraq_id(29404);
  script_xref(name:"RHSA", value:"2008:0288");

  script_name(english:"CentOS 3 / 4 : samba (CESA-2008:0288)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote CentOS host is missing one or more security updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Updated samba packages that fix a security issue and a bug are now
available for Red Hat Enterprise Linux 2.1, Red Hat Enterprise Linux
3, and Red Hat Enterprise Linux 4.

This update has been rated as having critical security impact by the
Red Hat Security Response Team.

Samba is a suite of programs used by machines to share files,
printers, and other information.

A heap-based buffer overflow flaw was found in the way Samba clients
handle over-sized packets. If a client connected to a malicious Samba
server, it was possible to execute arbitrary code as the Samba client
user. It was also possible for a remote user to send a specially
crafted print request to a Samba server that could result in the
server executing the vulnerable client code, resulting in arbitrary
code execution with the permissions of the Samba server.
(CVE-2008-1105)

Red Hat would like to thank Alin Rad Pop of Secunia Research for
responsibly disclosing this issue.

Users of Samba are advised to upgrade to these updated packages, which
contain a backported patch to resolve this issue."
  );
  # http://lists.centos.org/pipermail/centos-announce/2008-June/014946.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?9b2029e0"
  );
  # http://lists.centos.org/pipermail/centos-announce/2008-June/014947.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?7ddaccae"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://lists.centos.org/pipermail/centos-announce/2008-May/014939.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://lists.centos.org/pipermail/centos-announce/2008-May/014940.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://lists.centos.org/pipermail/centos-announce/2008-May/014944.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://lists.centos.org/pipermail/centos-announce/2008-May/014945.html"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected samba packages."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_set_cvss_temporal_vector("CVSS2#E:POC/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");
  script_cwe_id(119);

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:samba");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:samba-client");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:samba-common");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:samba-swat");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:3");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:4");

  script_set_attribute(attribute:"patch_publication_date", value:"2008/06/02");
  script_set_attribute(attribute:"plugin_publication_date", value:"2008/05/29");
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
if (rpm_check(release:"CentOS-3", reference:"samba-3.0.9-1.3E.15")) flag++;
if (rpm_check(release:"CentOS-3", reference:"samba-client-3.0.9-1.3E.15")) flag++;
if (rpm_check(release:"CentOS-3", reference:"samba-common-3.0.9-1.3E.15")) flag++;
if (rpm_check(release:"CentOS-3", reference:"samba-swat-3.0.9-1.3E.15")) flag++;

if (rpm_check(release:"CentOS-4", cpu:"i386", reference:"samba-3.0.25b-1.el4_6.5")) flag++;
if (rpm_check(release:"CentOS-4", cpu:"ia64", reference:"samba-3.0.25b-1.c4.5")) flag++;
if (rpm_check(release:"CentOS-4", cpu:"x86_64", reference:"samba-3.0.25b-1.el4_6.5")) flag++;
if (rpm_check(release:"CentOS-4", cpu:"i386", reference:"samba-client-3.0.25b-1.el4_6.5")) flag++;
if (rpm_check(release:"CentOS-4", cpu:"ia64", reference:"samba-client-3.0.25b-1.c4.5")) flag++;
if (rpm_check(release:"CentOS-4", cpu:"x86_64", reference:"samba-client-3.0.25b-1.el4_6.5")) flag++;
if (rpm_check(release:"CentOS-4", cpu:"i386", reference:"samba-common-3.0.25b-1.el4_6.5")) flag++;
if (rpm_check(release:"CentOS-4", cpu:"ia64", reference:"samba-common-3.0.25b-1.c4.5")) flag++;
if (rpm_check(release:"CentOS-4", cpu:"x86_64", reference:"samba-common-3.0.25b-1.el4_6.5")) flag++;
if (rpm_check(release:"CentOS-4", cpu:"i386", reference:"samba-swat-3.0.25b-1.el4_6.5")) flag++;
if (rpm_check(release:"CentOS-4", cpu:"ia64", reference:"samba-swat-3.0.25b-1.c4.5")) flag++;
if (rpm_check(release:"CentOS-4", cpu:"x86_64", reference:"samba-swat-3.0.25b-1.el4_6.5")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:rpm_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");