#!/usr/bin/python3
import os
import base64
import requests
import re
import json

URL = 'https://dingyue.space/link/aaITN8EcHAh4CVmr?sub=3&extend=1'


def getVmess(): 
    text = requests.get(URL).text
    recv = str(base64.b64decode(text))
    pattern = re.compile(r'vmess://(.*?)\\n')
    vmess_list = pattern.findall(recv)
    vmess_list_decode = []
    for vmess in vmess_list:
        vmess_decode = base64.b64decode(vmess).decode(encoding='utf-8')
        vmess_json = json.loads(vmess_decode)
        vmess_list_decode.append(vmess_json)

    return vmess_list_decode


def modifyConfig(address, port, id):
    config_file_path = '/etc/v2ray/config.json'
    # config_file_path = 'config.json'
    with open(config_file_path, 'r+') as config_file:
        config_json = json.load(config_file)
        config_json['outbounds'][0]['settings']['vnext'][0]['address'] = address
        config_json['outbounds'][0]['settings']['vnext'][0]['port'] = port
        config_json['outbounds'][0]['settings']['vnext'][0]['users'][0][id] = id

        config_file.truncate(0)
        config_file.seek(0)
        json.dump(config_json, config_file)

        

if __name__ == '__main__':
    vmess_list = getVmess()

    for i in range(len(vmess_list)):
        print("{}-{}".format(i, vmess_list[i]['ps']))

    choice_num = int(input("选择一个服务器\n"))

    while choice_num >= len(vmess_list) or choice_num < 0:
        print('输入有误，请输入正确数字。')
        choice_num = int(input("选择一个服务器\n"))
    
    choice = vmess_list[choice_num]

    modifyConfig(choice['add'], choice['port'], choice['id'])

    os.system('systemctl restart v2ray.service')
