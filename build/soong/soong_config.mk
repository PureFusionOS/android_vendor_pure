# Insert new variables inside the Pure structure
pure_soong:
	$(hide) mkdir -p $(dir $@)
	$(hide) (\
	echo '{'; \
	echo '"Pure": {'; \
	echo '    "Has_legacy_camera_hal1": $(if $(filter true,$(TARGET_HAS_LEGACY_CAMERA_HAL1)),true,false),'; \
	echo '    "Uses_media_extensions": $(if $(filter true,$(TARGET_USES_MEDIA_EXTENSIONS)),true,false),'; \
	echo '    "Uses_generic_camera_parameter_library": $(if $(TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY),false,true),'; \
	echo '    "Specific_camera_parameter_library": "$(TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY)",'; \
	echo '    "Needs_text_relocations": $(if $(filter true,$(TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS)),true,false),'; \
	echo '    "Mtk_hardware": $(if $(filter true,$(BOARD_USES_MTK_HARDWARE)),true,false),'; \
	echo '    "BoardUsesQTIHardware":  $(if $(BOARD_USES_QTI_HARDWARE),true,false),';  \
	echo '    "Libart_img_base": "$(LIBART_IMG_BASE)",'; \
	echo '    "QTIAudioPath":  "$(call project-path-for,qcom-audio)",'; \
	echo '    "QTIDisplayPath":  "$(call project-path-for,qcom-display)",'; \
	echo '    "QTIMediaPath":  "$(call project-path-for,qcom-media)",';  \
	echo '    "Cant_reallocate_omx_buffers":  $(if $(filter omap4,$(TARGET_BOARD_PLATFORM)),true,false),';  \
	echo '    "Qcom_bsp_legacy":  $(if $(filter msm7x27a msm7x30 msm8660 msm8960,$(TARGET_BOARD_PLATFORM)),true,false),';  \
	echo '    "Qti_flac_decoder":  $(if $(strip $(AUDIO_FEATURE_ENABLED_EXTN_FLAC_DECODER)),true,false),';  \
	echo '    "Use_legacy_rescaling":  $(if $(strip $(TARGET_OMX_LEGACY_RESCALING)),true,false),';  \
	echo '    "TargetUsesProprietaryLibs":  $(if $(strip $(TARGET_USES_PROPRIETARY_LIBS)),true,false),';  \
	echo '    "Target_uses_qsml":  $(if $(strip $(TARGET_USES_QSML)),true,false),';  \
	echo '    "Target_uses_eigen":  $(if $(strip $(TARGET_USES_QSML)),false,true),';  \
	echo '    "Target_shim_libs": "$(subst $(space),:,$(TARGET_LD_SHIM_LIBS))",'; \
	echo '    "Uses_qti_camera_device": $(if $(filter true,$(TARGET_USES_QTI_CAMERA_DEVICE)),true,false)'; \
	echo '},'; \
	echo '') > $(SOONG_VARIABLES_TMP)
