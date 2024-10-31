class GridUtils {
  static int responsiveGridColumn(double width) {
    return (width <= 640)
        ? 2
        : (width <= 768)
            ? 3
            : (width <= 1024)
                ? 3
                : (width <= 1280)
                    ? 5
                    : 5;
  }

  static double responsiveSize(double width, int size) {
    final grids = responsiveGridColumn(width);

    final itemWidth = (width / grids);
    return itemWidth * size;
  }
}
