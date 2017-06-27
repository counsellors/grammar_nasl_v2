#
# (C) Tenable Network Security, Inc.
#

include("compat.inc");

if (description)
{
  script_id(62586);
  script_version("$Revision: 1.8 $");
  script_cvs_date("$Date: 2015/02/03 17:40:03 $");

  script_cve_id("CVE-2012-4192", "CVE-2012-4193");
  script_bugtraq_id(56154, 56155);
  script_osvdb_id(86126, 86128);

  script_name(english:"Thunderbird 10.x < 10.0.9 Multiple Vulnerabilities (Mac OS X)");
  script_summary(english:"Checks version of Thunderbird");

  script_set_attribute(
    attribute:"synopsis",
    value:
"The remote Mac OS X host contains a mail client that is potentially
affected by several vulnerabilities."
  );
  script_set_attribute(
    attribute:"description",
    value:
"The installed version of Thunderbird 10.x is potentially affected by
the following security issues :

  - An unspecified error exists that can allow attackers to
    bypass the 'Same Origin Policy' and access the
    'Location' object. (CVE-2012-4192)

  - An error exists related to 'security wrappers' and the
    function 'defaultValue()' that can allow cross-site
    scripting attacks. (CVE-2012-4193)"
  );
  # http://www.thespanner.co.uk/2012/10/10/firefox-knows-what-your-friends-did-last-summer/
  script_set_attribute(attribute:"see_also", value:"http://www.nessus.org/u?8993e6b4");
  # https://blog.mozilla.org/security/2012/10/10/security-vulnerability-in-firefox-16/
  script_set_attribute(attribute:"see_also", value:"http://www.nessus.org/u?dc43f3c3");
  script_set_attribute(attribute:"see_also", value:"http://www.mozilla.org/security/announce/2012/mfsa2012-89.html");

  script_set_attribute(attribute:"solution", value:"Upgrade to Thunderbird 10.0.9 ESR or later.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:P/I:N/A:N");
  script_set_cvss_temporal_vector("CVSS2#E:ND/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"No known exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"false");
  script_cwe_id(20, 74, 79, 442, 629, 711, 712, 722, 725, 750, 751, 800, 801, 809, 811, 864, 900, 928, 931, 990);

  script_set_attribute(attribute:"vuln_publication_date", value:"2012/10/10");
  script_set_attribute(attribute:"patch_publication_date", value:"2012/10/11");
  script_set_attribute(attribute:"plugin_publication_date", value:"2012/10/17");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"cpe:/a:mozilla:thunderbird");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_family(english:"MacOS X Local Security Checks");

  script_copyright(english:"This script is Copyright (C) 2012-2015 Tenable Network Security, Inc.");

  script_dependencies("macosx_thunderbird_installed.nasl");
  script_require_keys("MacOSX/Thunderbird/Installed");

  exit(0);
}

include("mozilla_version.inc");
kb_base = "MacOSX/Thunderbird";
get_kb_item_or_exit(kb_base+"/Installed");

version = get_kb_item_or_exit(kb_base+"/Version", exit_code:1);
path = get_kb_item_or_exit(kb_base+"/Path", exit_code:1);

mozilla_check_version(product:'thunderbird', version:version, path:path, fix:'10.0.9', min:'10.0', severity:SECURITY_WARNING, xss:TRUE);