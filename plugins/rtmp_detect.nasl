#
# (C) Tenable Network Security, Inc.
#

include("compat.inc");

if (description)
{
  script_id(31097);
  script_version("$Revision: 1.6 $");
  script_cvs_date("$Date: 2011/03/11 21:18:09 $");

  script_name(english:"RTMP Server Detection");
  script_summary(english:"Initiates an RTMP handshake");

 script_set_attribute(attribute:"synopsis", value:
"A Flash media server is listening on the remote host." );
 script_set_attribute(attribute:"description", value:
"The remote service supports Real Time Messaging Protocol (RTMP), a
proprietary protocol used by Flash Player for streaming real-time
audio, video, and objects using a binary connection." );
 script_set_attribute(attribute:"see_also", value:"http://en.wikipedia.org/wiki/Real_Time_Messaging_Protocol" );
 script_set_attribute(attribute:"solution", value:
"Limit incoming traffic to this port if desired." );
 script_set_attribute(attribute:"risk_factor", value:"None" );
 script_set_attribute(attribute:"plugin_publication_date", value: "2008/02/15");
script_set_attribute(attribute:"plugin_type", value:"remote");
script_end_attributes();


  script_category(ACT_GATHER_INFO);
  script_family(english:"Service detection");

  script_copyright(english:"This script is Copyright (C) 2008-2011 Tenable Network Security, Inc.");

  script_dependencies("find_service2.nasl");
  script_require_ports("Services/unknown", 1935);

  exit(0);
}


include("byte_func.inc");
include("global_settings.inc");
include("misc_func.inc");

if (
  thorough_tests &&
  !get_kb_item("global_settings/disable_service_discovery")
)
{
  port = get_unknown_svc(1935);
  if (!port) exit(0, "Nessus has already identified the services on all open ports.");
}
else port = 1935;
if (known_service(port:port)) exit(0, "The service on port "+port+" is already known.");
if (!get_tcp_port_state(port)) exit(1, "Port "+port+" appears to be down.");

soc = open_sock_tcp(port);
if (!soc) exit(1, "Failed to open a socket on port "+port+".");

# Start a handshake.
req1 = raw_string(
        0x00, 0x02, 0x73, 0x94, 0x00, 0x00, 0x00, 
  0x00, 0xa5, 0x07, 0x6a, 0x7c, 0x73, 0xff, 0x90, 
  0xff, 0xd1, 0x0f, 0x86, 0x00, 0x3f, 0x15, 0xcc, 
  0x7c, 0x3d, 0x06, 0xe2, 0x7c, 0x4b, 0x05, 0x48, 
  0x7c, 0xe9, 0x00, 0x7e, 0x00, 0x97, 0xf0, 0x04, 
  0x7f, 0xd5, 0xfb, 0x5a, 0x02, 0x23, 0x15, 0x00, 
  0x7c, 0x01, 0x00, 0x76, 0x02, 0xef, 0x06, 0x3c, 
  0x7c, 0x6d, 0x00, 0xd2, 0x00, 0xfb, 0x00, 0xb8, 
  0x00, 0x19, 0x00, 0x6e, 0x77, 0x47, 0xfb, 0x74, 
  0x02, 0x05, 0x15, 0x4a, 0x7c, 0xd3, 0x20, 0x70, 
  0x00, 0x31, 0x06, 0x66, 0x7c, 0x9f, 0x00, 0xac, 
  0x00, 0x9d, 0x00, 0xc2, 0x00, 0xab, 0x00, 0x28, 
  0x00, 0x49, 0x00, 0x5e, 0x00, 0xf7, 0x00, 0xe4, 
  0x00, 0x35, 0x00, 0x3a, 0x00, 0x83, 0x00, 0xe0, 
  0x00, 0x61, 0x00, 0x56, 0x00, 0x4f, 0xb7, 0x1c, 
  0x02, 0xcd, 0x01, 0xb2, 0x01, 0x5b, 0x00, 0x98, 
  0x00, 0x79, 0x00, 0x4e, 0x00, 0xa7, 0x00, 0x54, 
  0x00, 0x65, 0x00, 0x2a, 0x00, 0x33, 0x00, 0x50, 
  0x00, 0x91, 0x00, 0x46, 0x00, 0xff, 0x00, 0x8c, 
  0x00, 0xfd, 0x00, 0xa2, 0x00, 0x0b, 0x00, 0x08, 
  0x00, 0xa9, 0x00, 0x3e, 0x00, 0x57, 0x01, 0xc4, 
  0x00, 0x95, 0x00, 0x1a, 0x00, 0xe3, 0xb7, 0xc0, 
  0x02, 0xc1, 0x2f, 0x36, 0x01, 0xaf, 0x06, 0xfc, 
  0x01, 0x2d, 0x00, 0x92, 0x00, 0xbb, 0x00, 0x78, 
  0x00, 0xd9, 0x01, 0x2e, 0x00, 0x07, 0x00, 0x34, 
  0x00, 0xc5, 0xb7, 0x0a, 0x02, 0x93, 0x00, 0x30, 
  0x00, 0xf1, 0x20, 0x26, 0x00, 0x5f, 0x00, 0x6c, 
  0x00, 0x5d, 0x01, 0x82, 0x00, 0x6b, 0x00, 0xe8, 
  0x00, 0x09, 0x00, 0x1e, 0x00, 0xb7, 0x00, 0xa4, 
  0x00, 0xf5, 0x00, 0xfa, 0x00, 0x43, 0x01, 0xa0, 
  0x00, 0x21, 0x00, 0x16, 0x00, 0x0f, 0x00, 0xdc, 
  0x00, 0x8d, 0x2f, 0x72, 0x01, 0x1b, 0x00, 0x58, 
  0x00, 0x39, 0xfa, 0x0e, 0x02, 0x67, 0x01, 0x14, 
  0x7c, 0x25, 0x00, 0xea, 0x00, 0xf3, 0x00, 0x10, 
  0x00, 0x51, 0x00, 0x06, 0x00, 0xbf, 0x00, 0x4c, 
  0x00, 0xbd, 0xfa, 0x62, 0x02, 0xcb, 0x02, 0xc8, 
  0x7c, 0x69, 0x00, 0xfe, 0x00, 0x17, 0x00, 0x84, 
  0x00, 0x55, 0x03, 0xda, 0x7c, 0xa3, 0x00, 0x80, 
  0x00, 0x81, 0xfb, 0xf6, 0x02, 0x6f, 0x00, 0xbc, 
  0x00, 0xed, 0x02, 0x52, 0x7c, 0x7b, 0x00, 0x38, 
  0x00, 0x99, 0xff, 0xee, 0xff, 0xc7, 0x00, 0xf4, 
  0x00, 0x85, 0x00, 0xca, 0x00, 0x53, 0x80, 0xf0, 
  0x7f, 0xb1, 0xfb, 0xe6, 0x02, 0x1f, 0x10, 0x2c, 
  0x00, 0x1d, 0x00, 0x42, 0x00, 0x2b, 0x00, 0xa8, 
  0x00, 0xc9, 0x03, 0xde, 0x7c, 0x77, 0x00, 0x64, 
  0x00, 0xb5, 0x00, 0xba, 0x00, 0x03, 0xfa, 0x60, 
  0x00, 0xe1, 0xfa, 0xd6, 0x02, 0xcf, 0xe3, 0x9c, 
  0x7c, 0x4d, 0x32, 0x32, 0x7c, 0xdb, 0x00, 0x18, 
  0x00, 0xf9, 0xfe, 0xce, 0x02, 0x27, 0xfe, 0xd4, 
  0x02, 0xe5, 0x00, 0xaa, 0x00, 0xb3, 0xff, 0xd0, 
  0xff, 0x11, 0x00, 0xc6, 0x00, 0x7f, 0xff, 0x0c, 
  0x02, 0x7d, 0x07, 0x22, 0x7c, 0x8b, 0xe4, 0x88, 
  0x7c, 0x29, 0x07, 0xbe, 0x7c, 0xd7, 0x03, 0x44, 
  0x00, 0x15, 0x07, 0x9a, 0x7c, 0x63, 0x00, 0x40, 
  0x00, 0x41, 0x84, 0xb6, 0x01, 0x2f, 0x01, 0x7c, 
  0x00, 0xad, 0xfb, 0x12, 0x02, 0x3b, 0xfb, 0xf8, 
  0x02, 0x59, 0x19, 0xae, 0x77, 0x87, 0x00, 0xb4, 
  0x00, 0x45, 0xb7, 0x8a, 0x02, 0x13, 0x00, 0xb0, 
  0x00, 0x71, 0x01, 0xa6, 0x00, 0xdf, 0x70, 0xec, 
  0x7f, 0xdd, 0x04, 0x02, 0x00, 0xeb, 0x08, 0x68, 
  0x00, 0x89, 0x00, 0x9e, 0x00, 0x37, 0x00, 0x24, 
  0x00, 0x75, 0x00, 0x7a, 0x00, 0xc3, 0x00, 0x20, 
  0x00, 0xa1, 0xfb, 0x96, 0x02, 0x8f, 0x00, 0x5c, 
  0x00, 0x0d, 0x00, 0xf2, 0x00, 0x9b, 0x00, 0xd8, 
  0x00, 0xb9, 0x00, 0x8e, 0x02, 0xe7, 0xf0, 0x94, 
  0x02, 0xa5, 0x00, 0x6a, 0x02, 0x73, 0x84, 0x90, 
  0x01, 0xd1, 0x84, 0x86, 0x01, 0x3f, 0x04, 0xcc, 
  0x00, 0x3d, 0x08, 0xe2, 0x00, 0x4b, 0xff, 0x48, 
  0xff, 0xe9, 0x00, 0x7e, 0x00, 0x97, 0x00, 0x04, 
  0x00, 0xd5, 0x03, 0x5a, 0x00, 0x23, 0x00, 0x00, 
  0x00, 0x01, 0x00, 0x76, 0x00, 0xef, 0x06, 0x3c, 
  0x7c, 0x6d, 0xff, 0xd2, 0xff, 0xfb, 0x06, 0xb8, 
  0x7c, 0x19, 0xfb, 0x6e, 0x02, 0x47, 0x00, 0x74, 
  0x00, 0x05, 0x07, 0x4a, 0x7c, 0xd3, 0x00, 0x70, 
  0x00, 0x31, 0x07, 0x66, 0x00, 0x9f, 0x00, 0xac, 
  0x00, 0x9d, 0x00, 0xc2, 0x00, 0xab, 0xfb, 0x28, 
  0x02, 0x49, 0x00, 0x5e, 0x00, 0xf7, 0xfd, 0xe4, 
  0x02, 0x35, 0xee, 0x3a, 0x7c, 0x83, 0x03, 0xe0, 
  0x00, 0x61, 0xfd, 0x56, 0x02, 0x4f, 0x15, 0x1c, 
  0x7c, 0xcd, 0x15, 0xb2, 0x7c, 0x5b, 0x06, 0x98, 
  0x7c, 0x79, 0x00, 0x4e, 0x00, 0xa7, 0x00, 0x54, 
  0x00, 0x65, 0x00, 0x2a, 0x00, 0x33, 0xfb, 0x50, 
  0x02, 0x91, 0x13, 0x46, 0x77, 0xff, 0xfb, 0x8c, 
  0x02, 0xfd, 0x00, 0xa2, 0x00, 0x0b, 0x49, 0x08, 
  0x00, 0xa9, 0x71, 0x3e, 0x71, 0x57, 0x15, 0xc4, 
  0x71, 0x95, 0xff, 0x1a, 0xff, 0xe3, 0x16, 0xc0, 
  0x71, 0xc1, 0xfc, 0x36, 0x02, 0xaf, 0x27, 0xfc, 
  0x02, 0x2d, 0x26, 0x92, 0x02, 0xbb, 0x00, 0x78, 
  0x00, 0xd9, 0x00, 0x2e, 0x00, 0x07, 0x00, 0x34, 
  0x00, 0xc5, 0x00, 0x0a, 0x00, 0x93, 0xd8, 0x30, 
  0x7c, 0xf1, 0x4d, 0x26, 0x71, 0x5f, 0x84, 0x6c, 
  0x01, 0x5d, 0x03, 0x82, 0x00, 0x6b, 0x00, 0xe8, 
  0x00, 0x09, 0x45, 0x1e, 0x01, 0xb7, 0xfc, 0xa4, 
  0x02, 0xf5, 0x08, 0xfa, 0x7c, 0x43, 0x00, 0xa0, 
  0x00, 0x21, 0x30, 0x16, 0x00, 0x0f, 0xff, 0xdc, 
  0x02, 0x8d, 0x00, 0x72, 0x00, 0x1b, 0x00, 0x58, 
  0x00, 0x39, 0x26, 0x0e, 0x02, 0x67, 0x4d, 0x14, 
  0x71, 0x25, 0xfc, 0xea, 0x02, 0xf3, 0x00, 0x10, 
  0x00, 0x51, 0x00, 0x06, 0x00, 0xbf, 0x00, 0x4c, 
  0x00, 0xbd, 0xb7, 0x62, 0x02, 0xcb, 0x00, 0xc8, 
  0x00, 0x69, 0xfc, 0xfe, 0x02, 0x17, 0x00, 0x84, 
  0x00, 0x55, 0x00, 0xda, 0x00, 0xa3, 0x00, 0x80, 
  0x00, 0x81, 0x00, 0xf6, 0x00, 0x6f, 0x00, 0xbc, 
  0x00, 0xed, 0x00, 0x52, 0x00, 0x7b, 0x00, 0x38, 
  0x00, 0x99, 0x00, 0xee, 0x00, 0xc7, 0x00, 0xf4, 
  0x00, 0x85, 0x20, 0xca, 0x00, 0x53, 0x20, 0xf0, 
  0x00, 0xb1, 0x00, 0xe6, 0x00, 0x1f, 0x00, 0x2c, 
  0x00, 0x1d, 0x03, 0x42, 0x00, 0x2b, 0x00, 0xa8, 
  0x00, 0xc9, 0x00, 0xde, 0x00, 0x77, 0x00, 0x64, 
  0x00, 0xb5, 0x00, 0xba, 0x00, 0x03, 0x00, 0x60, 
  0x00, 0xe1, 0x00, 0xd6, 0x00, 0xcf, 0x00, 0x9c, 
  0x00, 0x4d, 0x00, 0x32, 0x00, 0xdb, 0x00, 0x18, 
  0x00, 0xf9, 0x00, 0xce, 0x00, 0x27, 0x00, 0xd4, 
  0x00, 0xe5, 0x00, 0xaa, 0x00, 0xb3, 0x00, 0xd0, 
  0x00, 0x11, 0x00, 0xc6, 0x00, 0x7f, 0x00, 0x0c, 
  0x39, 0x7d, 0x00, 0x22, 0x00, 0x8b, 0x00, 0x88, 
  0x00, 0x29, 0x00, 0xbe, 0x00, 0xd7, 0x00, 0x44, 
  0x8f, 0x15, 0xa8, 0x9a, 0x0e, 0x63, 0x00, 0x40, 
  0x00, 0x41, 0x00, 0xb6, 0x00, 0x2f, 0x00, 0x7c, 
  0x00, 0xad, 0x00, 0x12, 0x00, 0x3b, 0x00, 0xf8, 
  0x00, 0x59, 0x20, 0xae, 0x00, 0x87, 0x00, 0xb4, 
  0x00, 0x45, 0x00, 0x8a, 0x00, 0x13, 0x00, 0xb0, 
  0x00, 0x71, 0x00, 0xa6, 0x00, 0xdf, 0x00, 0xec, 
  0x00, 0xdd, 0x00, 0x02, 0x00, 0xeb, 0x00, 0x68, 
  0x00, 0x89, 0x00, 0x9e, 0x00, 0x37, 0x00, 0x24, 
  0x00, 0x75, 0x00, 0x7a, 0x00, 0xc3, 0x26, 0x20, 
  0x02, 0xa1, 0x00, 0x96, 0x00, 0x8f, 0xfd, 0x5c, 
  0x02, 0x0d, 0x51, 0xf2, 0x71, 0x9b, 0xdb, 0xd8,
  0x00, 0xb9, 0x20, 0x8e, 0x00, 0xe7, 0x03, 0x94, 
  0x00, 0xa5, 0x03, 0x6a, 0x00, 0x73, 0xff, 0x90, 
  0x00, 0xd1, 0x10, 0x86, 0x00, 0x3f, 0x26, 0xcc, 
  0x02, 0x3d, 0x00, 0xe2, 0x00, 0x4b, 0x26, 0x48, 
  0x02, 0xe9, 0x26, 0x7e, 0x02, 0x97, 0xfd, 0x04, 
  0x02, 0xd5, 0x58, 0x5a, 0x71, 0x23, 0x26, 0x00, 
  0x02, 0x01, 0x00, 0x76, 0x00, 0xef, 0x26, 0x3c, 
  0x02, 0x6d, 0xfd, 0xd2, 0x02, 0xfb, 0x57, 0xb8, 
  0x71, 0x19, 0x57, 0x6e, 0x71, 0x47, 0x00, 0x74, 
  0x00, 0x05, 0x00, 0x4a, 0x00, 0xd3, 0x26, 0x70, 
  0x02, 0x31, 0x00, 0x66, 0x00, 0x9f, 0x00, 0xac, 
  0x00, 0x9d, 0x00, 0xc2, 0x00, 0xab, 0xb7, 0x28, 
  0x02, 0x49, 0x00, 0x5e, 0x00, 0xf7, 0x26, 0xe4, 
  0x02, 0x35, 0xfd, 0x3a, 0x02, 0x83, 0x00, 0xe0, 
  0x00, 0x61, 0xb7, 0x56, 0x02, 0x4f, 0xfd, 0x1c, 
  0x02, 0xcd, 0x01, 0xb2, 0x00, 0x5b, 0x00, 0x98, 
  0x00, 0x79, 0x00, 0x4e, 0x00, 0xa7, 0x8f, 0x54, 
  0xa8, 0x65, 0x0e, 0x2a, 0x00, 0x33, 0x00, 0x50, 
  0x00, 0x91, 0x00, 0x46, 0x00, 0xff, 0x00, 0x8c, 
  0x7c, 0xfd, 0x06, 0xa2, 0x7c, 0x0b, 0xdb, 0x08, 
  0x00, 0xa9, 0xfd, 0x3e, 0x02, 0x57, 0xfd, 0xc4, 
  0x02, 0x95, 0xfe, 0x1a, 0x02, 0xe3, 0x71, 0xc0, 
  0x71, 0xc1, 0x57, 0x36, 0x71, 0xaf, 0xff, 0xfc, 
  0xff, 0x2d, 0x57, 0x92, 0x71, 0xbb, 0x55, 0x78, 
  0x71, 0xd9, 0x26, 0x2e, 0x02, 0x07, 0xff, 0x34, 
  0x02, 0xc5, 0x00, 0x0a, 0x00, 0x93, 0x55, 0x30, 
  0x71, 0xf1, 0x55, 0x26, 0x71, 0x5f, 0x00, 0x6c, 
  0x00, 0x5d, 0x9e, 0x82, 0x7c, 0x6b, 0x00, 0xe8, 
  0x00, 0x09, 0x01, 0x1e, 0x01, 0xb7, 0x00, 0xa4, 
  0x00, 0xf5, 0x00, 0xfa, 0x00, 0x43, 0x00, 0xa0, 
  0x00, 0x21, 0x00, 0x16, 0x00, 0x0f, 0x26, 0xdc, 
  0x02, 0x8d, 0xe0, 0x72, 0x7c, 0x1b, 0x00, 0x58, 
  0x00, 0x39, 0x00, 0x0e, 0x00, 0x67, 0x04, 0x14, 
  0x00, 0x25, 0x08, 0xea, 0x00, 0xf3, 0x57, 0x10, 
  0x00, 0x51, 0x00, 0x06, 0x00, 0xbf, 0x00, 0x4c, 
  0x00, 0xbd, 0x00, 0x62, 0x00, 0xcb, 0x00, 0xc8, 
  0x00, 0x69, 0x00, 0xfe, 0x00, 0x17, 0x03, 0x84, 
  0x00, 0x55, 0x04, 0xda, 0x00, 0xa3, 0x08, 0x80, 
  0x00, 0x81, 0x00, 0xf6, 0x00, 0x6f, 0xe0, 0xbc, 
  0x7c, 0xed, 0xff, 0x52, 0xff, 0x7b, 0xe0, 0x38, 
  0x7c, 0x99, 0x15, 0xee, 0x71, 0xc7, 0xdb, 0xf4, 
  0x00, 0x85, 0xfe, 0xca, 0x02, 0x53, 0xff, 0xf0, 
  0xff, 0xb1, 0xff, 0xe6, 0x02, 0x1f, 0x71, 0x2c, 
  0x71, 0x1d, 0x55, 0x42, 0x71, 0x2b, 0xff, 0xa8, 
  0xff, 0xc9, 0x55, 0xde, 0x71, 0x77, 0x54, 0x64, 
  0x71, 0xb5, 0x03, 0xba, 0x00, 0x03, 0xff, 0x60, 
  0x02, 0xe1, 0x00, 0xd6, 0x00, 0xcf, 0x00, 0x9c, 
  0x00, 0x4d, 0x00, 0x32, 0x00, 0xdb, 0x00, 0x18, 
  0x00, 0xf9, 0x00, 0xce, 0x00, 0x27, 0x00, 0xd4, 
  0x00, 0xe5, 0x6a, 0xaa, 0x01, 0xb3, 0x01, 0xd0, 
  0x00, 0x11, 0xff, 0xc6, 0x02, 0x7f, 0x40, 0x0c, 
  0x71, 0x7d, 0x03, 0x22, 0x00, 0x8b, 0xff, 0x88, 
  0x02, 0x29, 0x00, 0xbe, 0x00, 0xd7, 0x00, 0x44, 
  0x00, 0x15, 0x2b, 0x9a, 0x71, 0x63, 0x6b, 0x40, 
  0x01, 0x41, 0x6a, 0xb6, 0x01, 0x2f, 0x40, 0x7c,
  0x71, 0xad, 0x93, 0x12, 0x00, 0x3b, 0xe7, 0xf8,
  0x00, 0x59, 0xfa, 0xae, 0x02, 0x87, 0x6b, 0xb4,
  0x01, 0x45, 0xff, 0x8a, 0x02, 0x13, 0x99, 0xb0,
  0x7c, 0x71, 0x08, 0xa6, 0x7c, 0xdf, 0xff, 0xec,
  0xff, 0xdd, 0x07, 0x02, 0x7c, 0xeb, 0x08, 0x68,
  0x7c, 0x89, 0xff, 0x9e, 0xff, 0x37, 0x00, 0x24,
  0x00, 0x75, 0x00, 0x7a, 0x00, 0xc3, 0x45, 0x20,
  0x01, 0xa1, 0x84, 0x96, 0x01, 0x8f, 0x00, 0x5c,
  0x00, 0x0d, 0x84, 0xf2, 0x01, 0x9b, 0xff, 0xd8, 
  0x02
);
send(socket:soc, data:mkbyte(3)+req1);

byte = recv(socket:soc, length:1);
if (strlen(byte) == 1 && byte == mkbyte(3))
{
  res1_1 = recv(socket:soc, length:1536);
  res1_2 = recv(socket:soc, length:1536);
  if (strlen(res1_2) == 1536 &&
    (
      substr(res1_2,0,6) == substr(req1,0,6) &&
      substr(res1_2,8) == substr(req1,8)
    )
  )
  {
    # Register and report the service(s).
    register_service(port:port, proto:"rtmp");
    security_note(port);
  }
}
close(soc);