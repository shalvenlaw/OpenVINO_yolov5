TEMPLATE = app
CONFIG += console c++17
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += \
        common/format_reader/MnistUbyte.cpp \
        common/format_reader/bmp.cpp \
        common/format_reader/format_reader.cpp \
        common/format_reader/opencv_wrapper.cpp \
        common/format_reader/yuv_nv12.cpp \
        common/utils/src/args_helper.cpp \
        common/utils/src/common.cpp \
        common/utils/src/slog.cpp \
        main.cpp

INCLUDEPATH += \
        common/format_reader \
        common/utils/include \

# OpenCV 4.5.5 world
win32:CONFIG(release, debug|release): LIBS += -L$$(OPENCV_BUILD)/x64/vc15/lib/ -lopencv_world455
else:win32:CONFIG(debug, debug|release): LIBS += -L$$(OPENCV_BUILD)/x64/vc15/lib/ -lopencv_world455d
INCLUDEPATH += $$(OPENCV_BUILD)/include

# OpenVINO 2022.1
win32:CONFIG(release, debug|release): LIBS += -L$$(OPENVINO_RUNTIME)/lib/intel64/release/ -lopenvino -lopenvino_paddle_frontend -lopenvino_ir_frontend -lopenvino_onnx_frontend
else:win32:CONFIG(debug, debug|release): LIBS += -L$$(OPENVINO_RUNTIME)/lib/intel64/debug/ -lopenvinod -lopenvino_paddle_frontendd -lopenvino_ir_frontendd -lopenvino_onnx_frontendd

INCLUDEPATH += \
        $$(OPENVINO_RUNTIME)/include \
        $$(OPENVINO_RUNTIME)/include/ie \
        $$(OPENVINO_RUNTIME)/include/ngraph \
        $$(OPENVINO_RUNTIME)/include/openvino

HEADERS += \
    common/format_reader/MnistUbyte.h \
    common/format_reader/bmp.h \
    common/format_reader/format_reader.h \
    common/format_reader/format_reader_ptr.h \
    common/format_reader/opencv_wrapper.h \
    common/format_reader/register.h \
    common/format_reader/yuv_nv12.h \
    common/utils/include/samples/args_helper.hpp \
    common/utils/include/samples/classification_results.h \
    common/utils/include/samples/common.hpp \
    common/utils/include/samples/console_progress.hpp \
    common/utils/include/samples/csv_dumper.hpp \
    common/utils/include/samples/ocv_common.hpp \
    common/utils/include/samples/os/windows/w_dirent.h \
    common/utils/include/samples/slog.hpp \
    common/utils/include/samples/vpu/vpu_tools_common.hpp

# 指定exe或dll的生成目录
win32:CONFIG(release, debug|release): DESTDIR = ../bin_release
else:win32:CONFIG(debug, debug|release): DESTDIR = ../bin_debug









