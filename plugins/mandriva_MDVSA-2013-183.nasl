#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Mandriva Linux Security Advisory MDVSA-2013:183. 
# The text itself is copyright (C) Mandriva S.A.
#

if (NASL_LEVEL < 3000) exit(0);

include("compat.inc");

if (description)
{
  script_id(67012);
  script_version("$Revision: 1.24 $");
  script_cvs_date("$Date: 2016/05/20 14:12:06 $");

  script_cve_id("CVE-2013-1500", "CVE-2013-1571", "CVE-2013-2407", "CVE-2013-2412", "CVE-2013-2443", "CVE-2013-2444", "CVE-2013-2445", "CVE-2013-2446", "CVE-2013-2447", "CVE-2013-2448", "CVE-2013-2449", "CVE-2013-2450", "CVE-2013-2452", "CVE-2013-2453", "CVE-2013-2454", "CVE-2013-2455", "CVE-2013-2456", "CVE-2013-2457", "CVE-2013-2458", "CVE-2013-2459", "CVE-2013-2460", "CVE-2013-2461", "CVE-2013-2463", "CVE-2013-2465", "CVE-2013-2469", "CVE-2013-2470", "CVE-2013-2471", "CVE-2013-2472", "CVE-2013-2473");
  script_bugtraq_id(60617, 60618, 60619, 60620, 60622, 60623, 60627, 60629, 60632, 60633, 60634, 60635, 60638, 60639, 60640, 60641, 60644, 60645, 60646, 60647, 60650, 60651, 60652, 60653, 60655, 60656, 60657, 60658, 60659);
  script_xref(name:"MDVSA", value:"2013:183");

  script_name(english:"Mandriva Linux Security Advisory : java-1.7.0-openjdk (MDVSA-2013:183)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:
"The remote Mandriva Linux host is missing one or more security
updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Updated java-1.7.0-openjdk packages fix multiple security
vulnerabilities

Multiple flaws were discovered in the ImagingLib and the image
attribute, channel, layout and raster processing in the 2D component.
An untrusted Java application or applet could possibly use these flaws
to trigger Java Virtual Machine memory corruption (CVE-2013-2470,
CVE-2013-2471, CVE-2013-2472, CVE-2013-2473, CVE-2013-2463,
CVE-2013-2465, CVE-2013-2469).

Integer overflow flaws were found in the way AWT processed certain
input. An attacker could use these flaws to execute arbitrary code
with the privileges of the user running an untrusted Java applet or
application (CVE-2013-2459).

Multiple improper permission check issues were discovered in the
Sound, JDBC, Libraries, JMX, and Serviceability components in OpenJDK.
An untrusted Java application or applet could use these flaws to
bypass Java sandbox restrictions (CVE-2013-2448, CVE-2013-2454,
CVE-2013-2458, CVE-2013-2457, CVE-2013-2453, CVE-2013-2460).

Multiple flaws in the Serialization, Networking, Libraries and CORBA
components can be exploited by an untrusted Java application or applet
to gain access to potentially sensitive information (CVE-2013-2456,
CVE-2013-2447, CVE-2013-2455, CVE-2013-2452, CVE-2013-2443,
CVE-2013-2446).

It was discovered that the Hotspot component did not properly handle
out-of-memory errors. An untrusted Java application or applet could
possibly use these flaws to terminate the Java Virtual Machine
(CVE-2013-2445).

It was discovered that the AWT component did not properly manage
certain resources and that the ObjectStreamClass of the Serialization
component did not properly handle circular references. An untrusted
Java application or applet could possibly use these flaws to cause a
denial of service (CVE-2013-2444, CVE-2013-2450).

It was discovered that the Libraries component contained certain
errors related to XML security and the class loader. A remote attacker
could possibly exploit these flaws to bypass intended security
mechanisms or disclose potentially sensitive information and cause a
denial of service (CVE-2013-2407, CVE-2013-2461).

It was discovered that JConsole did not properly inform the user when
establishing an SSL connection failed. An attacker could exploit this
flaw to gain access to potentially sensitive information
(CVE-2013-2412).

It was discovered that GnomeFileTypeDetector did not check for read
permissions when accessing files. An untrusted Java application or
applet could possibly use this flaw to disclose potentially sensitive
information (CVE-2013-2449).

It was found that documentation generated by Javadoc was vulnerable to
a frame injection attack. If such documentation was accessible over a
network, and a remote attacker could trick a user into visiting a
specially crafted URL, it would lead to arbitrary web content being
displayed next to the documentation. This could be used to perform a
phishing attack by providing frame content that spoofed a login form
on the site hosting the vulnerable documentation (CVE-2013-1571).

It was discovered that the 2D component created shared memory segments
with insecure permissions. A local attacker could use this flaw to
read or write to the shared memory segment (CVE-2013-1500)."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://advisories.mageia.org/MGASA-2013-0185.html"
  );
  # http://www.oracle.com/technetwork/topics/security/javacpujun2013-1899847.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?a094a6d7"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://rhn.redhat.com/errata/RHBA-2013-0959.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://rhn.redhat.com/errata/RHSA-2013-0957.html"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected packages.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:POC/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");
  script_set_attribute(attribute:"exploit_framework_core", value:"true");
  script_set_attribute(attribute:"exploited_by_malware", value:"true");
  script_set_attribute(attribute:"metasploit_name", value:'Java storeImageArray() Invalid Array Indexing Vulnerability');
  script_set_attribute(attribute:"exploit_framework_metasploit", value:"true");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:java-1.7.0-openjdk");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:java-1.7.0-openjdk-demo");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:java-1.7.0-openjdk-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:java-1.7.0-openjdk-javadoc");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:mandriva:linux:java-1.7.0-openjdk-src");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:mandriva:business_server:1");

  script_set_attribute(attribute:"patch_publication_date", value:"2013/06/27");
  script_set_attribute(attribute:"plugin_publication_date", value:"2013/06/28");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2013-2016 Tenable Network Security, Inc.");
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
if (rpm_check(release:"MDK-MBS1", cpu:"x86_64", reference:"java-1.7.0-openjdk-1.7.0.25-2.3.10.1.mbs1")) flag++;
if (rpm_check(release:"MDK-MBS1", cpu:"x86_64", reference:"java-1.7.0-openjdk-demo-1.7.0.25-2.3.10.1.mbs1")) flag++;
if (rpm_check(release:"MDK-MBS1", cpu:"x86_64", reference:"java-1.7.0-openjdk-devel-1.7.0.25-2.3.10.1.mbs1")) flag++;
if (rpm_check(release:"MDK-MBS1", reference:"java-1.7.0-openjdk-javadoc-1.7.0.25-2.3.10.1.mbs1")) flag++;
if (rpm_check(release:"MDK-MBS1", cpu:"x86_64", reference:"java-1.7.0-openjdk-src-1.7.0.25-2.3.10.1.mbs1")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:rpm_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");