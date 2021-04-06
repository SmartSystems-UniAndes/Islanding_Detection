import argparse

from demo_class import Demo


def get_parser():
    parser = argparse.ArgumentParser(description="Islanding Detection Demo")
    parser.add_argument(
        "--data_path",
        default="data/test_data.npy",
        help="Path with the demo data (default: data/test_data.npy)."
    )
    parser.add_argument(
        "--labels_path",
        default="data/test_labels.npy",
        help="Path with the demo labels (default: data/test_labels.npy)."
    )
    parser.add_argument(
        "--model_path",
        default="data/model/islanding_model.h5",
        help="Path .h5 model for binary classification (default: data/model/islanding_model.h5)."
    )

    return parser


if __name__ == "__main__":
    args = get_parser().parse_args()

    demo = Demo(args.data_path, args.labels_path, args.model_path)
    demo.run()
