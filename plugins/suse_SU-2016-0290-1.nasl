#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from SUSE update advisory SUSE-SU-2016:0290-1.
# The text itself is copyright (C) SUSE.
#

include("compat.inc");

if (description)
{
  script_id(88508);
  script_version("$Revision: 2.5 $");
  script_cvs_date("$Date: 2016/12/27 20:14:34 $");

  script_cve_id("CVE-2014-9687", "CVE-2016-1572");
  script_bugtraq_id(72560);
  script_osvdb_id(118484, 133518);

  script_name(english:"SUSE SLED11 / SLES11 Security Update : ecryptfs-utils (SUSE-SU-2016:0290-1)");
  script_summary(english:"Checks rpm output for the updated packages.");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote SUSE host is missing one or more security updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"This update for ecryptfs-utils fixes the following issues :

  - CVE-2016-1572: A local user could have escalated
    privileges by mounting over special filesystems
    (bsc#962052)

  - CVE-2014-9687: A default salt value reduced complexity
    of offline precomputation attacks (bsc#920160)

Note that Tenable Network Security has extracted the preceding
description block directly from the SUSE security advisory. Tenable
has attempted to automatically clean and format it as much as possible
without introducing additional issues."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://bugzilla.suse.com/920160"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://bugzilla.suse.com/962052"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://www.suse.com/security/cve/CVE-2014-9687.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://www.suse.com/security/cve/CVE-2016-1572.html"
  );
  # https://www.suse.com/support/update/announcement/2016/suse-su-20160290-1.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?091ecbe5"
  );
  script_set_attribute(
    attribute:"solution", 
    value:
"To install this SUSE Security Update use YaST online_update.
Alternatively you can run the command listed for your product :

SUSE Linux Enterprise Server for VMWare 11-SP3 :

zypper in -t patch slessp3-ecryptfs-utils-12379=1

SUSE Linux Enterprise Server 11-SP4 :

zypper in -t patch slessp4-ecryptfs-utils-12379=1

SUSE Linux Enterprise Server 11-SP3 :

zypper in -t patch slessp3-ecryptfs-utils-12379=1

SUSE Linux Enterprise Desktop 11-SP4 :

zypper in -t patch sledsp4-ecryptfs-utils-12379=1

SUSE Linux Enterprise Desktop 11-SP3 :

zypper in -t patch sledsp3-ecryptfs-utils-12379=1

SUSE Linux Enterprise Debuginfo 11-SP4 :

zypper in -t patch dbgsp4-ecryptfs-utils-12379=1

SUSE Linux Enterprise Debuginfo 11-SP3 :

zypper in -t patch dbgsp3-ecryptfs-utils-12379=1

To bring your system up-to-date, use 'zypper patch'."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_set_cvss_temporal_vector("CVSS2#E:U/RL:U/RC:C");
  script_set_cvss3_base_vector("CVSS:3.0/AV:L/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H");
  script_set_cvss3_temporal_vector("CVSS:3.0/E:U/RL:U/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"No known exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"false");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:suse_linux:ecryptfs-utils");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:suse_linux:ecryptfs-utils-32bit");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:novell:suse_linux:11");

  script_set_attribute(attribute:"patch_publication_date", value:"2016/01/30");
  script_set_attribute(attribute:"plugin_publication_date", value:"2016/02/01");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2016 Tenable Network Security, Inc.");
  script_family(english:"SuSE Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/cpu", "Host/SuSE/release", "Host/SuSE/rpm-list");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("rpm.inc");


if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
release = get_kb_item("Host/SuSE/release");
if (isnull(release) || release !~ "^(SLED|SLES)") audit(AUDIT_OS_NOT, "SUSE");
os_ver = eregmatch(pattern: "^(SLE(S|D)\d+)", string:release);
if (isnull(os_ver)) audit(AUDIT_UNKNOWN_APP_VER, "SUSE");
os_ver = os_ver[1];
if (! ereg(pattern:"^(SLED11|SLES11)$", string:os_ver)) audit(AUDIT_OS_NOT, "SUSE SLED11 / SLES11", "SUSE " + os_ver);

if (!get_kb_item("Host/SuSE/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if (cpu !~ "^i[3-6]86$" && "x86_64" >!< cpu && "s390x" >!< cpu) audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "SUSE " + os_ver, cpu);

sp = get_kb_item("Host/SuSE/patchlevel");
if (isnull(sp)) sp = "0";
if (os_ver == "SLES11" && (! ereg(pattern:"^(3|4)$", string:sp))) audit(AUDIT_OS_NOT, "SLES11 SP3/4", os_ver + " SP" + sp);
if (os_ver == "SLED11" && (! ereg(pattern:"^(3|4)$", string:sp))) audit(AUDIT_OS_NOT, "SLED11 SP3/4", os_ver + " SP" + sp);


flag = 0;
if (rpm_check(release:"SLES11", sp:"4", cpu:"x86_64", reference:"ecryptfs-utils-32bit-61-1.35.1")) flag++;
if (rpm_check(release:"SLES11", sp:"4", cpu:"s390x", reference:"ecryptfs-utils-32bit-61-1.35.1")) flag++;
if (rpm_check(release:"SLES11", sp:"4", reference:"ecryptfs-utils-61-1.35.1")) flag++;
if (rpm_check(release:"SLES11", sp:"3", cpu:"x86_64", reference:"ecryptfs-utils-32bit-61-1.35.1")) flag++;
if (rpm_check(release:"SLES11", sp:"3", cpu:"s390x", reference:"ecryptfs-utils-32bit-61-1.35.1")) flag++;
if (rpm_check(release:"SLES11", sp:"3", reference:"ecryptfs-utils-61-1.35.1")) flag++;
if (rpm_check(release:"SLED11", sp:"4", cpu:"x86_64", reference:"ecryptfs-utils-61-1.35.1")) flag++;
if (rpm_check(release:"SLED11", sp:"4", cpu:"x86_64", reference:"ecryptfs-utils-32bit-61-1.35.1")) flag++;
if (rpm_check(release:"SLED11", sp:"4", cpu:"i586", reference:"ecryptfs-utils-61-1.35.1")) flag++;
if (rpm_check(release:"SLED11", sp:"3", cpu:"x86_64", reference:"ecryptfs-utils-61-1.35.1")) flag++;
if (rpm_check(release:"SLED11", sp:"3", cpu:"x86_64", reference:"ecryptfs-utils-32bit-61-1.35.1")) flag++;
if (rpm_check(release:"SLED11", sp:"3", cpu:"i586", reference:"ecryptfs-utils-61-1.35.1")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:rpm_report_get());
  else security_warning(0);
  exit(0);
}
else
{
  tested = pkg_tests_get();
  if (tested) audit(AUDIT_PACKAGE_NOT_AFFECTED, tested);
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "ecryptfs-utils");
}