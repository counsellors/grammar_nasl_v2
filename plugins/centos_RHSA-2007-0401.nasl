#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Red Hat Security Advisory RHSA-2007:0401 and 
# CentOS Errata and Security Advisory 2007:0401 respectively.
#

if (NASL_LEVEL < 3000) exit(0);

include("compat.inc");

if (description)
{
  script_id(38103);
  script_version("$Revision: 1.11 $");
  script_cvs_date("$Date: 2016/11/17 20:59:08 $");

  script_cve_id("CVE-2007-1362", "CVE-2007-1558", "CVE-2007-2867", "CVE-2007-2868", "CVE-2007-2869", "CVE-2007-2871");
  script_bugtraq_id(23257, 24242);
  script_osvdb_id(35134, 35135, 35136, 35137, 35138, 35139, 35140);
  script_xref(name:"RHSA", value:"2007:0401");

  script_name(english:"CentOS 4 / 5 : thunderbird (CESA-2007:0401)");
  script_summary(english:"Checks rpm output for the updated package");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote CentOS host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Updated thunderbird packages that fix several security bugs are now
available for Red Hat Enterprise Linux 4 and 5.

This update has been rated as having critical security impact by the
Red Hat Security Response Team.

Mozilla Thunderbird is a standalone mail and newsgroup client.

Several flaws were found in the way Thunderbird processed certain
malformed JavaScript code. A web page containing malicious JavaScript
code could cause Thunderbird to crash or potentially execute arbitrary
code as the user running Thunderbird. (CVE-2007-2867, CVE-2007-2868)

Several denial of service flaws were found in the way Thunderbird
handled certain form and cookie data. A malicious website that is able
to set arbitrary form and cookie data could prevent Thunderbird from
functioning properly. (CVE-2007-1362, CVE-2007-2869)

A flaw was found in the way Thunderbird processed certain APOP
authentication requests. By sending certain responses when Thunderbird
attempted to authenticate against an APOP server, a remote attacker
could potentially acquire certain portions of a user's authentication
credentials. (CVE-2007-1558)

A flaw was found in the way Thunderbird displayed certain web content.
A malicious web page could generate content which could overlay user
interface elements such as the hostname and security indicators,
tricking users into thinking they are visiting a different site.
(CVE-2007-2871)

Users of Thunderbird are advised to apply this update, which contains
Thunderbird version 1.5.0.12 that corrects these issues."
  );
  # http://lists.centos.org/pipermail/centos-announce/2007-June/013855.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?25855f3e"
  );
  # http://lists.centos.org/pipermail/centos-announce/2007-June/013865.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?169a7a22"
  );
  # http://lists.centos.org/pipermail/centos-announce/2007-June/013866.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?e289f654"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://lists.centos.org/pipermail/centos-announce/2007-May/013843.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://lists.centos.org/pipermail/centos-announce/2007-May/013844.html"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected thunderbird package."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:ND/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");
  script_cwe_id(20, 94, 119);

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:thunderbird");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:4");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:5");

  script_set_attribute(attribute:"patch_publication_date", value:"2007/06/02");
  script_set_attribute(attribute:"plugin_publication_date", value:"2009/04/23");
  script_set_attribute(attribute:"vuln_publication_date", value:"2007/05/30");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2009-2016 Tenable Network Security, Inc.");
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
if (rpm_check(release:"CentOS-4", reference:"thunderbird-1.5.0.12-0.1.el4.centos")) flag++;

if (rpm_check(release:"CentOS-5", reference:"thunderbird-1.5.0.12-1.el5.centos")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:rpm_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");