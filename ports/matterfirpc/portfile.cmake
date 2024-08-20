set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_from_git(
  OUT_SOURCE_PATH
  SOURCE_PATH
  URL
  ssh://git@github.com/matterfi/matterfirpc.git
  REF
  1ec5d487697e65afdfe617c28b396b1825b82a7c
  HEAD_REF
  release-0.2)

vcpkg_cmake_configure(
  SOURCE_PATH
  "${SOURCE_PATH}"
  OPTIONS
  -DMATTERFIRPC_BUILD_TESTS=OFF
  -DMATTERFIRPC_PEDANTIC_BUILD=OFF
  OPTIONS_RELEASE
  -DMATTERFIRPC_DEBUG_BUILD=OFF
  -DMATTERFIRPC_INSTALL_LICENSE=ON
  -DMATTERFIRPC_LICENSE_FILE_NAME=copyright
  OPTIONS_DEBUG
  -DMATTERFIRPC_DEBUG_BUILD=ON
  -DMATTERFIRPC_INSTALL_HEADERS=OFF
  -DMATTERFIRPC_INSTALL_LICENSE=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
  PACKAGE_NAME
  "MatterFiRPC"
  NO_PREFIX_CORRECTION
)

file(
  INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
)
