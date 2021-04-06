import os
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

from sklearn.metrics import confusion_matrix

os.environ['TF_CPP_MIN_LOG_LEVEL'] = '3'
import tensorflow as tf


def plot_confusion_matrix(y_true, y_hat):
    cm = confusion_matrix(y_true, y_hat)
    cm = cm.astype('float')

    plt.figure(figsize=(8, 8))

    ax = sns.heatmap(cm, annot=True, cbar=False)

    ax.xaxis.tick_top()
    ax.xaxis.set_label_position('top')

    plt.xlabel("Predicted Class")
    plt.ylabel("True Class")
    plt.title("Confusion Matrix")
    plt.show()

    return None


class Demo:
    def __init__(self, data_path, labels_path, classification_model):
        print("Loading data...")
        self.data = np.load(data_path)
        self.labels = np.load(labels_path)
        self.classification_model = tf.keras.models.load_model(classification_model)

    def run(self):
        print("|-------------------------------------------------------------------|")
        print("Classifying images...")

        y_hat = np.argmax(self.classification_model.predict(self.data, verbose=1), axis=1)

        print("-Labels:")
        print("0: Grid-connected C_ON")
        print("1: Grid connected C_OFF")
        print("2: Sudden switching OFF C")
        print("3: Sudden switching ON C")
        print("4: Islanding event C_ON")
        print("5: Islanding event C_OFF")
        print("6: LL-Fault")
        print("7: LN-Fault")
        print("|-------------------------------------------------------------------|")

        plot_confusion_matrix(self.labels, y_hat)

        return True
