import 'package:flutter/material.dart';
import 'package:gun_core_flutter/gun_core_flutter.dart';
import 'package:gun_core_flutter/src/license/gun_core.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gun_core_flutter/src/ui/ui_single_select/entity/single_select_option_entity.dart';
class UISingleSelect<T> extends StatefulWidget {
  final T? selected;
  final List<T>? options;
  final Widget Function(T? item) builderSelected;
  final Widget? noSelectedWidget;
  final Widget Function({SingleSelectOptionEntity<T>? option})? builderOption;
  final Function(T item)? onSelected;
  final double? height;
  final bool isDisabled;
  final String? title;
  const UISingleSelect({
    super.key,
    required this.builderSelected,
    this.noSelectedWidget,
    this.selected,
    this.options = const [],
    this.height,
    this.builderOption,
    this.onSelected,
    this.title,
    this.isDisabled = false,
  });
  @override
  State<UISingleSelect<T>> createState() => _n42<T>();
}
class _n42<T> extends State<UISingleSelect<T>> {
  final ScrollController _o47 = ScrollController();
  final Map<int, GlobalKey> _p62 = {};
  void _q53(BuildContext context) async {
    _p62.clear();
    for (int i = 0; i < (widget.options?.length ?? 0); i++) {
      _p62[i] = GlobalKey();
    }
    showCupertinoModalBottomSheet(
      context: context,
      useRootNavigator: true,
      topRadius: Radius.circular(32.r),
      builder: (context) => SafeArea(
        child: Material(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxHeight: widget.height ?? MediaQuery.of(context).size.height * 0.5,
                ),
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 12.h),
                      width: 60.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                    ),
                    widget.title != null ? Container(
                      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
                      child: UIText(
                        text: widget.title ?? 'Select an option',
                        textStyle: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ) : Container(),
                    Expanded(
                      child: ListView.builder(
                        controller: _o47,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: widget.options?.length ?? 0,
                        itemBuilder: (context, index) {
                          final item = widget.options![index];
                          final key = _p62[index];
                          return GestureDetector(
                            key: key,
                            onTap: () {
                              widget.onSelected?.call(item);
                              Navigator.pop(context);
                            },
                            child: widget.builderOption != null
                                ? widget.builderOption!(
                              option: SingleSelectOptionEntity<T>(
                                item: item,
                                isSelected: widget.selected == item,
                              ),
                            )
                                : ListTile(
                              title: UIText(text: item.toString()
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final selectedIndex = widget.options?.indexOf(widget.selected as T);
      if (selectedIndex != null && selectedIndex >= 0) {
        final key = _p62[selectedIndex];
        final context = key?.currentContext;
        if (context != null) {
          final box = context.findRenderObject() as RenderBox;
          final offset = box.localToGlobal(Offset.zero);
          final scrollableBox = _o47.position.context.storageContext.findRenderObject() as RenderBox;
          final yOffset = offset.dy - scrollableBox.localToGlobal(Offset.zero).dy;
          _o47.animateTo(
            yOffset,
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
          );
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    GunCore.ensureLicensed();
    return GestureDetector(
      onTap: () {
        widget.isDisabled ? null : _q53(context);
      },
      child: widget.selected != null
          ? widget.builderSelected(widget.selected as T)
          : widget.noSelectedWidget ??
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: UIText(
                text: "Select an option",
                textStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ),
    );
  }
}