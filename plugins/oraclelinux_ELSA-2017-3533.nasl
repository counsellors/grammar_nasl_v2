#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from Oracle Linux Security Advisory ELSA-2017-3533.
#

if (NASL_LEVEL < 3000) exit(0);

include("compat.inc");

if (description)
{
  script_id(99159);
  script_version("$Revision: 3.2 $");
  script_cvs_date("$Date: 2017/04/07 15:07:04 $");

  script_cve_id("CVE-2015-8952", "CVE-2016-10088", "CVE-2016-10147", "CVE-2016-3140", "CVE-2016-3672", "CVE-2016-3951", "CVE-2016-7097", "CVE-2016-7425", "CVE-2016-8399", "CVE-2016-8632", "CVE-2016-8633", "CVE-2016-8645", "CVE-2016-9178", "CVE-2016-9588", "CVE-2016-9644", "CVE-2016-9756", "CVE-2017-2596", "CVE-2017-2636", "CVE-2017-5897", "CVE-2017-5970", "CVE-2017-6001", "CVE-2017-6345", "CVE-2017-7187");
  script_osvdb_id(135876, 136761, 136805, 143514, 143515, 144411, 146703, 146777, 146778, 147168, 148132, 148195, 148246, 148443, 148861, 150498, 151239, 151568, 151927, 152728, 152729, 153186, 154043);

  script_name(english:"Oracle Linux 6 / 7 : Unbreakable Enterprise kernel (ELSA-2017-3533)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Oracle Linux host is missing one or more security updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Description of changes:

[4.1.12-61.1.33.el7uek]
- Revert 'x86/mm: Expand the exception table logic to allow new handling 
options' (Brian Maly)  [Orabug: 25790387]  {CVE-2016-9644}
- Revert 'fix minor infoleak in get_user_ex()' (Brian Maly)  [Orabug: 
25790387]  {CVE-2016-9644}

[4.1.12-61.1.32.el7uek]
- x86/mm: Expand the exception table logic to allow new handling options 
(Tony Luck)  [Orabug: 25790387]  {CVE-2016-9644}

[4.1.12-61.1.31.el7uek]
- rebuild bumping release

[4.1.12-61.1.30.el7uek]
- net: ping: check minimum size on ICMP header length (Kees Cook) 
[Orabug: 25766898]  {CVE-2016-8399} {CVE-2016-8399}
- sg_write()/bsg_write() is not fit to be called under KERNEL_DS (Al 
Viro)  [Orabug: 25765436]  {CVE-2016-10088}
- scsi: sg: check length passed to SG_NEXT_CMD_LEN (peter chang) 
[Orabug: 25751984]  {CVE-2017-7187}

[4.1.12-61.1.29.el7uek]
- tty: n_hdlc: get rid of racy n_hdlc.tbuf (Alexander Popov)  [Orabug: 
25696677]  {CVE-2017-2636}
- TTY: n_hdlc, fix lockdep false positive (Jiri Slaby)  [Orabug: 
25696677]  {CVE-2017-2636}
- If Slot Status indicates changes in both Data Link Layer Status and 
Presence Detect, prioritize the Link status change. (Jack Vogel) 
[Orabug: 25353783]
- PCI: pciehp: Leave power indicator on when enabling already-enabled 
slot (Ashok Raj)  [Orabug: 25353783]
- firewire: net: guard against rx buffer overflows (Stefan Richter) 
[Orabug: 25451520]  {CVE-2016-8633}
- usbnet: cleanup after bind() in probe() (Oliver Neukum)  [Orabug: 
25463898]  {CVE-2016-3951}
- cdc_ncm: do not call usbnet_link_change from cdc_ncm_bind (Bj&oslash rn Mork) 
  [Orabug: 25463898]  {CVE-2016-3951}
- cdc_ncm: Add support for moving NDP to end of NCM frame (Enrico Mioso) 
  [Orabug: 25463898]  {CVE-2016-3951}
- x86/mm/32: Enable full randomization on i386 and X86_32 (Hector 
Marco-Gisbert)  [Orabug: 25463918]  {CVE-2016-3672}
- kvm: fix page struct leak in handle_vmon (Paolo Bonzini)  [Orabug: 
25507133]  {CVE-2017-2596}
- crypto: mcryptd - Check mcryptd algorithm compatibility (tim) 
[Orabug: 25507153]  {CVE-2016-10147}
- kvm: nVMX: Allow L1 to intercept software exceptions (#BP and #OF) 
(Jim Mattson)  [Orabug: 25507188]  {CVE-2016-9588}
- KVM: x86: drop error recovery in em_jmp_far and em_ret_far (Radim 
Kr&#x10D m&aacute &#x159 )  [Orabug: 25507213]  {CVE-2016-9756}
- tcp: take care of truncations done by sk_filter() (Eric Dumazet) 
[Orabug: 25507226]  {CVE-2016-8645}
- rose: limit sk_filter trim to payload (Willem de Bruijn)  [Orabug: 
25507226]  {CVE-2016-8645}
- tipc: check minimum bearer MTU (Michal Kube&#x10D ek)  [Orabug: 25507239] 
{CVE-2016-8632} {CVE-2016-8632}
- fix minor infoleak in get_user_ex() (Al Viro)  [Orabug: 25507269] 
{CVE-2016-9178}
- scsi: arcmsr: Simplify user_len checking (Borislav Petkov)  [Orabug: 
25507319]  {CVE-2016-7425}
- scsi: arcmsr: Buffer overflow in arcmsr_iop_message_xfer() (Dan 
Carpenter)  [Orabug: 25507319]  {CVE-2016-7425}
- tmpfs: clear S_ISGID when setting posix ACLs (Gu Zheng)  [Orabug: 
25507341]  {CVE-2016-7097} {CVE-2016-7097}
- posix_acl: Clear SGID bit when setting file permissions (Jan Kara) 
[Orabug: 25507341]  {CVE-2016-7097} {CVE-2016-7097}
- ext2: convert to mbcache2 (Jan Kara)  [Orabug: 25512366]  {CVE-2015-8952}
- ext4: convert to mbcache2 (Jan Kara)  [Orabug: 25512366]  {CVE-2015-8952}
- mbcache2: reimplement mbcache (Jan Kara)  [Orabug: 25512366] 
{CVE-2015-8952}
- USB: digi_acceleport: do sanity checking for the number of ports 
(Oliver Neukum)  [Orabug: 25512466]  {CVE-2016-3140}
- net/llc: avoid BUG_ON() in skb_orphan() (Eric Dumazet)  [Orabug: 
25682419]  {CVE-2017-6345}
- net/mlx4_core: Disallow creation of RAW QPs on a VF (Eli Cohen) 
[Orabug: 25697847]
- ipv4: keep skb->dst around in presence of IP options (Eric Dumazet) 
[Orabug: 25698300]  {CVE-2017-5970}
- perf/core: Fix concurrent sys_perf_event_open() vs. 'move_group' race 
(Peter Zijlstra)  [Orabug: 25698751]  {CVE-2017-6001}
- ip6_gre: fix ip6gre_err() invalid reads (Eric Dumazet)  [Orabug: 
25699015]  {CVE-2017-5897}
- mpt3sas: Don't spam logs if logging level is 0 (Johannes Thumshirn) 
[Orabug: 25699035]
- xen-netfront: cast grant table reference first to type int (Dongli 
Zhang)
- xen-netfront: do not cast grant table reference to signed short 
(Dongli Zhang)"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://oss.oracle.com/pipermail/el-errata/2017-April/006815.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://oss.oracle.com/pipermail/el-errata/2017-April/006816.html"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected unbreakable enterprise kernel packages."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:U/RL:OF/RC:C");
  script_set_cvss3_base_vector("CVSS:3.0/AV:L/AC:L/PR:L/UI:N/S:U/C:H/I:H/A:H");
  script_set_cvss3_temporal_vector("CVSS:3.0/E:U/RL:O/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"No known exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"false");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:dtrace-modules-4.1.12-61.1.33.el6uek");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:dtrace-modules-4.1.12-61.1.33.el7uek");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:kernel-uek");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:kernel-uek-debug");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:kernel-uek-debug-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:kernel-uek-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:kernel-uek-doc");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:kernel-uek-firmware");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:oracle:linux:6");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:oracle:linux:7");

  script_set_attribute(attribute:"patch_publication_date", value:"2017/04/01");
  script_set_attribute(attribute:"plugin_publication_date", value:"2017/04/03");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2017 Tenable Network Security, Inc.");
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
if (! ereg(pattern:"^(6|7)([^0-9]|$)", string:os_ver)) audit(AUDIT_OS_NOT, "Oracle Linux 6 / 7", "Oracle Linux " + os_ver);

if (!get_kb_item("Host/RedHat/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && cpu !~ "^i[3-6]86$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Oracle Linux", cpu);
if ("x86_64" >!< cpu) audit(AUDIT_ARCH_NOT, "x86_64", cpu);

flag = 0;
if (rpm_check(release:"EL6", cpu:"x86_64", reference:"dtrace-modules-4.1.12-61.1.33.el6uek-0.5.3-2.el6")) flag++;
if (rpm_exists(release:"EL6", rpm:"kernel-uek-4.1.12") && rpm_check(release:"EL6", cpu:"x86_64", reference:"kernel-uek-4.1.12-61.1.33.el6uek")) flag++;
if (rpm_exists(release:"EL6", rpm:"kernel-uek-debug-4.1.12") && rpm_check(release:"EL6", cpu:"x86_64", reference:"kernel-uek-debug-4.1.12-61.1.33.el6uek")) flag++;
if (rpm_exists(release:"EL6", rpm:"kernel-uek-debug-devel-4.1.12") && rpm_check(release:"EL6", cpu:"x86_64", reference:"kernel-uek-debug-devel-4.1.12-61.1.33.el6uek")) flag++;
if (rpm_exists(release:"EL6", rpm:"kernel-uek-devel-4.1.12") && rpm_check(release:"EL6", cpu:"x86_64", reference:"kernel-uek-devel-4.1.12-61.1.33.el6uek")) flag++;
if (rpm_exists(release:"EL6", rpm:"kernel-uek-doc-4.1.12") && rpm_check(release:"EL6", cpu:"x86_64", reference:"kernel-uek-doc-4.1.12-61.1.33.el6uek")) flag++;
if (rpm_exists(release:"EL6", rpm:"kernel-uek-firmware-4.1.12") && rpm_check(release:"EL6", cpu:"x86_64", reference:"kernel-uek-firmware-4.1.12-61.1.33.el6uek")) flag++;

if (rpm_check(release:"EL7", cpu:"x86_64", reference:"dtrace-modules-4.1.12-61.1.33.el7uek-0.5.3-2.el7")) flag++;
if (rpm_exists(release:"EL7", rpm:"kernel-uek-4.1.12") && rpm_check(release:"EL7", cpu:"x86_64", reference:"kernel-uek-4.1.12-61.1.33.el7uek")) flag++;
if (rpm_exists(release:"EL7", rpm:"kernel-uek-debug-4.1.12") && rpm_check(release:"EL7", cpu:"x86_64", reference:"kernel-uek-debug-4.1.12-61.1.33.el7uek")) flag++;
if (rpm_exists(release:"EL7", rpm:"kernel-uek-debug-devel-4.1.12") && rpm_check(release:"EL7", cpu:"x86_64", reference:"kernel-uek-debug-devel-4.1.12-61.1.33.el7uek")) flag++;
if (rpm_exists(release:"EL7", rpm:"kernel-uek-devel-4.1.12") && rpm_check(release:"EL7", cpu:"x86_64", reference:"kernel-uek-devel-4.1.12-61.1.33.el7uek")) flag++;
if (rpm_exists(release:"EL7", rpm:"kernel-uek-doc-4.1.12") && rpm_check(release:"EL7", cpu:"x86_64", reference:"kernel-uek-doc-4.1.12-61.1.33.el7uek")) flag++;
if (rpm_exists(release:"EL7", rpm:"kernel-uek-firmware-4.1.12") && rpm_check(release:"EL7", cpu:"x86_64", reference:"kernel-uek-firmware-4.1.12-61.1.33.el7uek")) flag++;


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
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "affected kernel");
}
