#
# (C) Tenable Network Security, Inc.
#
# The descriptive text is (C) Scientific Linux.
#

if (NASL_LEVEL < 3000) exit(0);

include("compat.inc");

if (description)
{
  script_id(71301);
  script_version("$Revision: 1.2 $");
  script_cvs_date("$Date: 2013/12/23 14:11:58 $");

  script_cve_id("CVE-2012-2392", "CVE-2012-3825", "CVE-2012-4285", "CVE-2012-4288", "CVE-2012-4289", "CVE-2012-4290", "CVE-2012-4291", "CVE-2012-4292", "CVE-2012-6056", "CVE-2012-6059", "CVE-2012-6060", "CVE-2012-6061", "CVE-2012-6062", "CVE-2013-3557", "CVE-2013-3559", "CVE-2013-3561", "CVE-2013-4081", "CVE-2013-4083", "CVE-2013-4927", "CVE-2013-4931", "CVE-2013-4932", "CVE-2013-4933", "CVE-2013-4934", "CVE-2013-4935", "CVE-2013-4936", "CVE-2013-5721");

  script_name(english:"Scientific Linux Security Update : wireshark on SL6.x i386/x86_64");
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
"Two flaws were found in Wireshark. If Wireshark read a malformed
packet off a network or opened a malicious dump file, it could crash
or, possibly, execute arbitrary code as the user running Wireshark.
(CVE-2013-3559, CVE-2013-4083)

Several denial of service flaws were found in Wireshark. Wireshark
could crash or stop responding if it read a malformed packet off a
network, or opened a malicious dump file. (CVE-2012-2392,
CVE-2012-3825, CVE-2012-4285, CVE-2012-4288, CVE-2012-4289,
CVE-2012-4290, CVE-2012-4291, CVE-2012-4292, CVE-2012-5595,
CVE-2012-5597, CVE-2012-5598, CVE-2012-5599, CVE-2012-5600,
CVE-2012-6056, CVE-2012-6059, CVE-2012-6060, CVE-2012-6061,
CVE-2012-6062, CVE-2013-3557, CVE-2013-3561, CVE-2013-4081,
CVE-2013-4927, CVE-2013-4931, CVE-2013-4932, CVE-2013-4933,
CVE-2013-4934, CVE-2013-4935, CVE-2013-4936, CVE-2013-5721)

The wireshark packages have been upgraded to upstream version 1.8.10,
which provides a number of bug fixes and enhancements over the
previous versions. For more information on the bugs fixed,
enhancements included, and supported protocols introduced, refer to
the Wireshark Release Notes.

This update also fixes the following bugs :

  - Previously, Wireshark did not parse the RECLAIM-COMPLETE
    opcode when inspecting traffic generated by NFSv4.1. A
    patch has been provided to enable the parsing of the
    RECLAIM_COMPLETE opcode, and Wireshark is now able to
    properly dissect and handle NFSv4.1 traffic.

  - Prior to this update, frame arrival times in a text file
    were reported one hour ahead from the timestamps in the
    packet capture file. This resulted in various failures
    being reported by the dfilter-test.py test suite. To fix
    this bug, frame arrival timestamps have been shifted by
    one hour, thus fixing this bug.

  - The 'tshark -D' command returned output to STDERR
    instead of STDOUT, which could break scripts that are
    parsing the 'tshark -D' output. This bug has been fixed,
    and the 'tshark -D' command now writes output data to a
    correct standard stream.

  - Due to an array overrun, Wireshark could experience
    undefined program behavior or could unexpectedly
    terminate. With this update, proper array handling
    ensures Wireshark no longer crashes in the described
    scenario.

  - Previously, the dftest and randpkt command line
    utilities lacked manual pages. This update adds proper
    manual pages for both utilities.

In addition, this update adds the following enhancements :

  - With this update, Wireshark is able to properly dissect
    and handle InfiniBand and GlusterFS traffic.

All running instances of Wireshark must be restarted for the update to
take effect."
  );
  # http://listserv.fnal.gov/scripts/wa.exe?A2=ind1312&L=scientific-linux-errata&T=0&P=2440
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?bd354488"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected packages.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:C");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"x-cpe:/o:fermilab:scientific_linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2013/11/21");
  script_set_attribute(attribute:"plugin_publication_date", value:"2013/12/10");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2013 Tenable Network Security, Inc.");
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
if (rpm_check(release:"SL6", reference:"wireshark-1.8.10-4.el6")) flag++;
if (rpm_check(release:"SL6", reference:"wireshark-debuginfo-1.8.10-4.el6")) flag++;
if (rpm_check(release:"SL6", reference:"wireshark-devel-1.8.10-4.el6")) flag++;
if (rpm_check(release:"SL6", reference:"wireshark-gnome-1.8.10-4.el6")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:rpm_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");