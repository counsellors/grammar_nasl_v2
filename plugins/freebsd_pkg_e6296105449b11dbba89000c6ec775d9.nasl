#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from the FreeBSD VuXML database :
#
# Copyright 2003-2016 Jacques Vidrine and contributors
#
# Redistribution and use in source (VuXML) and 'compiled' forms (SGML,
# HTML, PDF, PostScript, RTF and so forth) with or without modification,
# are permitted provided that the following conditions are met:
# 1. Redistributions of source code (VuXML) must retain the above
#    copyright notice, this list of conditions and the following
#    disclaimer as the first lines of this file unmodified.
# 2. Redistributions in compiled form (transformed to other DTDs,
#    published online in any format, converted to PDF, PostScript,
#    RTF and other formats) must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer
#    in the documentation and/or other materials provided with the
#    distribution.
# 
# THIS DOCUMENTATION IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
# OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
# OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS DOCUMENTATION,
# EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

include("compat.inc");

if (description)
{
  script_id(22350);
  script_version("$Revision: 1.21 $");
  script_cvs_date("$Date: 2016/12/08 20:42:12 $");

  script_cve_id("CVE-2006-4253", "CVE-2006-4340", "CVE-2006-4565", "CVE-2006-4566", "CVE-2006-4567", "CVE-2006-4568", "CVE-2006-4569", "CVE-2006-4570", "CVE-2006-4571");
  script_bugtraq_id(20042);

  script_name(english:"FreeBSD : mozilla -- multiple vulnerabilities (e6296105-449b-11db-ba89-000c6ec775d9)");
  script_summary(english:"Checks for updated packages in pkg_info output");

  script_set_attribute(
    attribute:"synopsis", 
    value:
"The remote FreeBSD host is missing one or more security-related
updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"The Mozilla Foundation reports of multiple security issues in Firefox,
SeaMonkey, and Thunderbird. Several of these issues can probably be
used to run arbitrary code with the privilege of the user running the
program.

- MFSA 2006-64 Crashes with evidence of memory corruption (rv:1.8.0.7)

- MFSA 2006-63 JavaScript execution in mail via XBL

- MFSA 2006-62 Popup-blocker cross-site scripting (XSS)

- MFSA 2006-61 Frame spoofing using document.open()

- MFSA 2006-60 RSA Signature Forgery

- MFSA 2006-59 Concurrency-related vulnerability

- MFSA 2006-58 Auto-Update compromise through DNS and SSL spoofing

- MFSA 2006-57 JavaScript Regular Expression Heap Corruption"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.mozilla.org/security/announce/2006/mfsa2006-57.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.mozilla.org/security/announce/2006/mfsa2006-58.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.mozilla.org/security/announce/2006/mfsa2006-59.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.mozilla.org/security/announce/2006/mfsa2006-60.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.mozilla.org/security/announce/2006/mfsa2006-61.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.mozilla.org/security/announce/2006/mfsa2006-62.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.mozilla.org/security/announce/2006/mfsa2006-63.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.mozilla.org/security/announce/2006/mfsa2006-64.html"
  );
  # http://www.freebsd.org/ports/portaudit/e6296105-449b-11db-ba89-000c6ec775d9.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?547f7e31"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected packages.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:ND/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");
  script_cwe_id(20, 79, 119, 264);

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:freebsd:freebsd:firefox");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:freebsd:freebsd:linux-firefox");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:freebsd:freebsd:linux-firefox-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:freebsd:freebsd:linux-mozilla");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:freebsd:freebsd:linux-mozilla-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:freebsd:freebsd:linux-seamonkey");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:freebsd:freebsd:linux-seamonkey-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:freebsd:freebsd:linux-thunderbird");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:freebsd:freebsd:mozilla");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:freebsd:freebsd:mozilla-thunderbird");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:freebsd:freebsd:seamonkey");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:freebsd:freebsd:thunderbird");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:freebsd:freebsd");

  script_set_attribute(attribute:"vuln_publication_date", value:"2006/09/14");
  script_set_attribute(attribute:"patch_publication_date", value:"2006/09/15");
  script_set_attribute(attribute:"plugin_publication_date", value:"2006/09/15");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2006-2016 Tenable Network Security, Inc.");
  script_family(english:"FreeBSD Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/FreeBSD/release", "Host/FreeBSD/pkg_info");

  exit(0);
}


include("audit.inc");
include("freebsd_package.inc");


if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
if (!get_kb_item("Host/FreeBSD/release")) audit(AUDIT_OS_NOT, "FreeBSD");
if (!get_kb_item("Host/FreeBSD/pkg_info")) audit(AUDIT_PACKAGE_LIST_MISSING);


flag = 0;

if (pkg_test(save_report:TRUE, pkg:"firefox<1.5.0.7,1")) flag++;
if (pkg_test(save_report:TRUE, pkg:"firefox>2.*,1<2.0_1,1")) flag++;
if (pkg_test(save_report:TRUE, pkg:"linux-firefox<1.5.0.7")) flag++;
if (pkg_test(save_report:TRUE, pkg:"seamonkey<1.0.5")) flag++;
if (pkg_test(save_report:TRUE, pkg:"linux-seamonkey<1.0.5")) flag++;
if (pkg_test(save_report:TRUE, pkg:"thunderbird<1.5.0.7")) flag++;
if (pkg_test(save_report:TRUE, pkg:"linux-thunderbird<1.5.0.7")) flag++;
if (pkg_test(save_report:TRUE, pkg:"mozilla-thunderbird<1.5.0.7")) flag++;
if (pkg_test(save_report:TRUE, pkg:"linux-firefox-devel<3.0.a2006.09.21")) flag++;
if (pkg_test(save_report:TRUE, pkg:"linux-seamonkey-devel<1.5.a2006.09.21")) flag++;
if (pkg_test(save_report:TRUE, pkg:"linux-mozilla-devel>0")) flag++;
if (pkg_test(save_report:TRUE, pkg:"linux-mozilla>0")) flag++;
if (pkg_test(save_report:TRUE, pkg:"mozilla>0")) flag++;

if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:pkg_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");