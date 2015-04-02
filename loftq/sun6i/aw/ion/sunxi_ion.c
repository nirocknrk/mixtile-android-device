/*
 *  ion.c
 *
 * Memory Allocator functions for ion
 *
 *   Copyright 2011 Google, Inc
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
#define LOG_TAG "sunxi_ion"

#include <cutils/log.h>
#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <sys/types.h>

#include <linux/ion.h>
#include <ion/ion.h>
#include "sunxi_ion.h"


int ion_getphyadr(int fd,void *handle_fd)
{
  int ret = 0;
  struct ion_custom_data custom_data;
  sunxi_phys_data phys_data;
  custom_data.cmd = ION_IOC_SUNXI_PHYS_ADDR;
  phys_data.handle = handle_fd;
  custom_data.arg = (unsigned long)&phys_data;
  ret = ioctl(fd, ION_IOC_CUSTOM, &custom_data);
  if(ret < 0)
    return 0;
  return phys_data.phys_addr;
}

