#
# Copyright (C) 2010 The Android Open Source Project
# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Makefile for producing cygnus sdk coverage reports.
# Run "make cygnus-sdk-test-coverage" in the $ANDROID_BUILD_TOP directory.

cygnus_sdk_api_coverage_exe := $(HOST_OUT_EXECUTABLES)/cygnus-sdk-api-coverage
dexdeps_exe := $(HOST_OUT_EXECUTABLES)/dexdeps

coverage_out := $(HOST_OUT)/cygnus-sdk-api-coverage

api_text_description := cygnus-sdk/api/cygnus_current.txt
api_xml_description := $(coverage_out)/api.xml
$(api_xml_description) : $(api_text_description) $(APICHECK)
	$(hide) echo "Converting API file to XML: $@"
	$(hide) mkdir -p $(dir $@)
	$(hide) $(APICHECK_COMMAND) -convert2xml $< $@

cygnus-sdk-test-coverage-report := $(coverage_out)/cygnus-sdk-test-coverage.html

cygnus_sdk_tests_apk := $(call intermediates-dir-for,APPS,CygnusPlatformTests)/package.apk
cygnussettingsprovider_tests_apk := $(call intermediates-dir-for,APPS,CygnusSettingsProviderTests)/package.apk
cygnus_sdk_api_coverage_dependencies := $(cygnus_sdk_api_coverage_exe) $(dexdeps_exe) $(api_xml_description)

$(cygnus-sdk-test-coverage-report): PRIVATE_TEST_CASES := $(cygnus_sdk_tests_apk) $(cygnussettingsprovider_tests_apk)
$(cygnus-sdk-test-coverage-report): PRIVATE_CYGNUS_SDK_API_COVERAGE_EXE := $(cygnus_sdk_api_coverage_exe)
$(cygnus-sdk-test-coverage-report): PRIVATE_DEXDEPS_EXE := $(dexdeps_exe)
$(cygnus-sdk-test-coverage-report): PRIVATE_API_XML_DESC := $(api_xml_description)
$(cygnus-sdk-test-coverage-report): $(cygnus_sdk_tests_apk) $(cygnussettingsprovider_tests_apk) $(cygnus_sdk_api_coverage_dependencies) | $(ACP)
	$(call generate-cygnus-coverage-report,"CYGNUS-SDK API Coverage Report",\
			$(PRIVATE_TEST_CASES),html)

.PHONY: cygnus-sdk-test-coverage
cygnus-sdk-test-coverage : $(cygnus-sdk-test-coverage-report)

# Put the test coverage report in the dist dir if "cygnus-sdk" is among the build goals.
ifneq ($(filter cygnus-sdk, $(MAKECMDGOALS)),)
  $(call dist-for-goals, cygnus-sdk, $(cygnus-sdk-test-coverage-report):cygnus-sdk-test-coverage-report.html)
endif

# Arguments;
#  1 - Name of the report printed out on the screen
#  2 - List of apk files that will be scanned to generate the report
#  3 - Format of the report
define generate-cygnus-coverage-report
	$(hide) mkdir -p $(dir $@)
	$(hide) $(PRIVATE_CYGNUS_SDK_API_COVERAGE_EXE) -d $(PRIVATE_DEXDEPS_EXE) -a $(PRIVATE_API_XML_DESC) -f $(3) -o $@ $(2) -cm
	@ echo $(1): file://$@
endef

# Reset temp vars
cygnus_sdk_api_coverage_dependencies :=
cygnus-sdk-combined-coverage-report :=
cygnus-sdk-combined-xml-coverage-report :=
cygnus-sdk-verifier-coverage-report :=
cygnus-sdk-test-coverage-report :=
api_xml_description :=
api_text_description :=
coverage_out :=
dexdeps_exe :=
cygnus_sdk_api_coverage_exe :=
cygnus_sdk_verifier_apk :=
android_cygnus_sdk_zip :=
