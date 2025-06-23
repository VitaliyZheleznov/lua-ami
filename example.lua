--------------------------------------------------------------------------------
-- interactive-test.lua: interactive test
-- This file is a part of Lua-AMI library
-- Copyright (c) Lua-AMI authors (see file `COPYRIGHT` for the license)
--------------------------------------------------------------------------------
-- Little tool, to accsess "live" asterisk: send originate command
-- @script interactive-test.lua
--------------------------------------------------------------------------------

local ami = require "ami/init"
local inspect = require 'inspect'

local config =
{
  host = "127.0.0.1";
  port = 5039;
  tls = true;
  username = "ami";
  secret = "";
  timeout = 60*1000;
  auth = 'md5';
  --logger = print;
}


local AMI = ami.new(config)

AMI:subscribe('*', function(e)
  print('unknown event received!')
  print(inspect(e))
  coroutine.yield()
end)

AMI:events('call')

--print('-- get info for 303101')
--local res, err = AMI:execute('PJSIPShowEndpoint', {Endpoint='3030101'} )
--print(res.EndpointDetail.Callerid)

--print('-- pjsip reload')
--local res, err = AMI:execute('Command', {Command='pjsip reload'} )
--print(res)

--print('-- get all endpoints')
--local res, err = AMI:execute('PJSIPShowEndpoints')
--print('total ' .. #res .. ' endpoints')
