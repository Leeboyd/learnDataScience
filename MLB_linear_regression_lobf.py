{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "metadata": {},
   "outputs": [],
   "source": [
    "import matplotlib.pyplot as plt\n",
    "import seaborn as sns\n",
    "from sklearn import datasets, linear_model\n",
    "from sklearn.datasets import make_regression\n",
    "from sklearn.model_selection import train_test_split"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "metadata": {},
   "outputs": [],
   "source": [
    "# Create a data set for analysis\n",
    "x, y = make_regression(n_samples=500, n_features = 1, noise=25, random_state=0)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "metadata": {},
   "outputs": [],
   "source": [
    "# Split the data set into testing and training data\n",
    "x_train, x_test, y_train, y_test = train_test_split(x, y, random_state=0)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "metadata": {},
   "outputs": [],
   "source": [
    "# Create a linear regression object\n",
    "regression = linear_model.LinearRegression()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "LinearRegression(copy_X=True, fit_intercept=True, n_jobs=None,\n",
       "         normalize=False)"
      ]
     },
     "execution_count": 5,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "# Train the model using the training set\n",
    "regression.fit(x_train, y_train)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "metadata": {},
   "outputs": [],
   "source": [
    "# Make predictions using the testing set\n",
    "y_predictions = regression.predict(x_test)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "[<matplotlib.lines.Line2D at 0x1a22c8dcc0>]"
      ]
     },
     "execution_count": 7,
     "metadata": {},
     "output_type": "execute_result"
    },
    {
     "data": {
      "image/png": "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\n",
      "text/plain": [
       "<Figure size 432x288 with 1 Axes>"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# plot the data\n",
    "sns.set_style(\"darkgrid\")\n",
    "sns.regplot(x_test, y_test, fit_reg=False) # fit_reg=False 就可以讓 regression line 消失.\n",
    "plt.plot(x_test, y_predictions, color='black')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.7.3"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 2
}
