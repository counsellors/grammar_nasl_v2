#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from Red Hat Security Advisory RHSA-2016:2046 and 
# Oracle Linux Security Advisory ELSA-2016-2046 respectively.
#

include("compat.inc");

if (description)
{
  script_id(93948);
  script_version("$Revision: 2.9 $");
  script_cvs_date("$Date: 2016/12/07 21:08:17 $");

  script_cve_id("CVE-2014-7810", "CVE-2015-5346", "CVE-2016-5388", "CVE-2016-5425", "CVE-2016-6325");
  script_osvdb_id(122158, 134827, 141670, 145333, 145546);
  script_xref(name:"RHSA", value:"2016:2046");

  script_name(english:"Oracle Linux 7 : tomcat (ELSA-2016-2046) (httpoxy)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Oracle Linux host is missing one or more security updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"From Red Hat Security Advisory 2016:2046 :

An update for tomcat is now available for Red Hat Enterprise Linux 7.

Red Hat Product Security has rated this update as having a security
impact of Important. A Common Vulnerability Scoring System (CVSS) base
score, which gives a detailed severity rating, is available for each
vulnerability from the CVE link(s) in the References section.

Apache Tomcat is a servlet container for the Java Servlet and
JavaServer Pages (JSP) technologies.

Security Fix(es) :

* It was discovered that the Tomcat packages installed configuration
file /usr/lib/tmpfiles.d/tomcat.conf writeable to the tomcat group. A
member of the group or a malicious web application deployed on Tomcat
could use this flaw to escalate their privileges. (CVE-2016-5425)

* It was discovered that the Tomcat packages installed certain
configuration files read by the Tomcat initialization script as
writeable to the tomcat group. A member of the group or a malicious
web application deployed on Tomcat could use this flaw to escalate
their privileges. (CVE-2016-6325)

* It was found that the expression language resolver evaluated
expressions within a privileged code section. A malicious web
application could use this flaw to bypass security manager
protections. (CVE-2014-7810)

* It was discovered that tomcat used the value of the Proxy header
from HTTP requests to initialize the HTTP_PROXY environment variable
for CGI scripts, which in turn was incorrectly used by certain HTTP
client implementations to configure the proxy for outgoing HTTP
requests. A remote attacker could possibly use this flaw to redirect
HTTP requests performed by a CGI script to an attacker-controlled
proxy via a malicious HTTP request. (CVE-2016-5388)

* A session fixation flaw was found in the way Tomcat recycled the
requestedSessionSSL field. If at least one web application was
configured to use the SSL session ID as the HTTP session ID, an
attacker could reuse a previously used session ID for further
requests. (CVE-2015-5346)

Red Hat would like to thank Dawid Golunski (http://legalhackers.com)
for reporting CVE-2016-5425 and Scott Geary (VendHQ) for reporting
CVE-2016-5388. The CVE-2016-6325 issue was discovered by Red Hat
Product Security."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://oss.oracle.com/pipermail/el-errata/2016-October/006407.html"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected tomcat packages."
  );
  script_set_cvss_base_vector("CVSS2#AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:F/RL:TF/RC:ND");
  script_set_cvss3_base_vector("CVSS:3.0/AV:N/AC:H/PR:N/UI:N/S:U/C:H/I:H/A:H");
  script_set_cvss3_temporal_vector("CVSS:3.0/E:F/RL:T/RC:X");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:tomcat");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:tomcat-admin-webapps");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:tomcat-docs-webapp");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:tomcat-el-2.2-api");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:tomcat-javadoc");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:tomcat-jsp-2.2-api");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:tomcat-jsvc");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:tomcat-lib");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:tomcat-servlet-3.0-api");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:tomcat-webapps");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:oracle:linux:7");

  script_set_attribute(attribute:"patch_publication_date", value:"2016/10/11");
  script_set_attribute(attribute:"in_the_news", value:"true");
  script_set_attribute(attribute:"plugin_publication_date", value:"2016/10/11");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2016 Tenable Network Security, Inc.");
  script_family(english:"Oracle Linux Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/OracleLinux", "Host/RedHat/release", "Host/RedHat/rpm-list");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("rpm.inc");


if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
if (!get_kb_item("Host/OracleLinux")) audit(AUDIT_OS_NOT, "Oracle Linux");
release = get_kb_item("Host/RedHat/release");
if (isnull(release) || !eregmatch(pattern: "Oracle (?:Linux Server|Enterprise Linux)", string:release)) audit(AUDIT_OS_NOT, "Oracle Linux");
os_ver = eregmatch(pattern: "Oracle (?:Linux Server|Enterprise Linux) .*release ([0-9]+(\.[0-9]+)?)", string:release);
if (isnull(os_ver)) audit(AUDIT_UNKNOWN_APP_VER, "Oracle Linux");
os_ver = os_ver[1];
if (! ereg(pattern:"^7([^0-9]|$)", string:os_ver)) audit(AUDIT_OS_NOT, "Oracle Linux 7", "Oracle Linux " + os_ver);

if (!get_kb_item("Host/RedHat/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && cpu !~ "^i[3-6]86$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Oracle Linux", cpu);
if ("x86_64" >!< cpu) audit(AUDIT_ARCH_NOT, "x86_64", cpu);

flag = 0;
if (rpm_check(release:"EL7", cpu:"x86_64", reference:"tomcat-7.0.54-8.el7_2")) flag++;
if (rpm_check(release:"EL7", cpu:"x86_64", reference:"tomcat-admin-webapps-7.0.54-8.el7_2")) flag++;
if (rpm_check(release:"EL7", cpu:"x86_64", reference:"tomcat-docs-webapp-7.0.54-8.el7_2")) flag++;
if (rpm_check(release:"EL7", cpu:"x86_64", reference:"tomcat-el-2.2-api-7.0.54-8.el7_2")) flag++;
if (rpm_check(release:"EL7", cpu:"x86_64", reference:"tomcat-javadoc-7.0.54-8.el7_2")) flag++;
if (rpm_check(release:"EL7", cpu:"x86_64", reference:"tomcat-jsp-2.2-api-7.0.54-8.el7_2")) flag++;
if (rpm_check(release:"EL7", cpu:"x86_64", reference:"tomcat-jsvc-7.0.54-8.el7_2")) flag++;
if (rpm_check(release:"EL7", cpu:"x86_64", reference:"tomcat-lib-7.0.54-8.el7_2")) flag++;
if (rpm_check(release:"EL7", cpu:"x86_64", reference:"tomcat-servlet-3.0-api-7.0.54-8.el7_2")) flag++;
if (rpm_check(release:"EL7", cpu:"x86_64", reference:"tomcat-webapps-7.0.54-8.el7_2")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:rpm_report_get());
  else security_hole(0);
  exit(0);
}
else
{
  tested = pkg_tests_get();
  if (tested) audit(AUDIT_PACKAGE_NOT_AFFECTED, tested);
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "tomcat / tomcat-admin-webapps / tomcat-docs-webapp / etc");
}