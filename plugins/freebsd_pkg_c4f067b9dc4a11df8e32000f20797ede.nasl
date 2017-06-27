#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from the FreeBSD VuXML database :
#
# Copyright 2003-2015 Jacques Vidrine and contributors
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
  script_id(50074);
  script_version("$Revision: 1.11 $");
  script_cvs_date("$Date: 2015/05/13 14:37:10 $");

  script_cve_id("CVE-2010-3170", "CVE-2010-3173", "CVE-2010-3174", "CVE-2010-3175", "CVE-2010-3176", "CVE-2010-3177", "CVE-2010-3178", "CVE-2010-3179", "CVE-2010-3180", "CVE-2010-3181", "CVE-2010-3182", "CVE-2010-3183");

  script_name(english:"FreeBSD : mozilla -- multiple vulnerabilities (c4f067b9-dc4a-11df-8e32-000f20797ede)");
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
"The Mozilla Project reports :

MFSA 2010-64 Miscellaneous memory safety hazards (rv:1.9.2.11/
1.9.1.14)

MFSA 2010-65 Buffer overflow and memory corruption using
document.write

MFSA 2010-66 Use-after-free error in nsBarProp

MFSA 2010-67 Dangling pointer vulnerability in LookupGetterOrSetter

MFSA 2010-68 XSS in gopher parser when parsing hrefs

MFSA 2010-69 Cross-site information disclosure via modal calls

MFSA 2010-70 SSL wildcard certificate matching IP addresses

MFSA 2010-71 Unsafe library loading vulnerabilities

MFSA 2010-72 Insecure Diffie-Hellman key exchange"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.mozilla.org/security/announce/2010/mfsa2010-64.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.mozilla.org/security/announce/2010/mfsa2010-65.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.mozilla.org/security/announce/2010/mfsa2010-66.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.mozilla.org/security/announce/2010/mfsa2010-67.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.mozilla.org/security/announce/2010/mfsa2010-68.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.mozilla.org/security/announce/2010/mfsa2010-69.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.mozilla.org/security/announce/2010/mfsa2010-70.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.mozilla.org/security/announce/2010/mfsa2010-71.html"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.mozilla.org/security/announce/2010/mfsa2010-72.html"
  );
  # http://www.freebsd.org/ports/portaudit/c4f067b9-dc4a-11df-8e32-000f20797ede.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?6aace5b0"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected packages.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:freebsd:freebsd:firefox");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:freebsd:freebsd:libxul");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:freebsd:freebsd:linux-firefox");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:freebsd:freebsd:linux-firefox-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:freebsd:freebsd:seamonkey");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:freebsd:freebsd:thunderbird");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:freebsd:freebsd");

  script_set_attribute(attribute:"vuln_publication_date", value:"2010/10/19");
  script_set_attribute(attribute:"patch_publication_date", value:"2010/10/20");
  script_set_attribute(attribute:"plugin_publication_date", value:"2010/10/21");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2010-2015 Tenable Network Security, Inc.");
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

if (pkg_test(save_report:TRUE, pkg:"firefox>3.6.*,1<3.6.11,1")) flag++;
if (pkg_test(save_report:TRUE, pkg:"firefox>3.5.*,1<3.5.14,1")) flag++;
if (pkg_test(save_report:TRUE, pkg:"libxul>1.9.2.*<1.9.2.11")) flag++;
if (pkg_test(save_report:TRUE, pkg:"linux-firefox<3.6.11,1")) flag++;
if (pkg_test(save_report:TRUE, pkg:"linux-firefox-devel<3.5.14")) flag++;
if (pkg_test(save_report:TRUE, pkg:"seamonkey>2.0.*<2.0.9")) flag++;
if (pkg_test(save_report:TRUE, pkg:"thunderbird>=3.0<3.0.9")) flag++;
if (pkg_test(save_report:TRUE, pkg:"thunderbird>=3.1<3.1.5")) flag++;

if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:pkg_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");