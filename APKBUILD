# Contributor: Carlos Giraldo <cgiraldo@gradiant.org>
# Maintainer: Carlos Giraldo <cgiraldo@gradiant.org>
pkgname=py3-pandas
_pkgname=pandas
pkgver=1.3.2
pkgrel=2
pkgdesc="Powerful data structures for data analysis, time series, and statistics"
url="https://pandas.pydata.org/"
arch="all"
license="BSD-3-Clause"
depends="py3-dateutil py3-numpy py3-tz"
makedepends="linux-headers py3-numpy-dev python3-dev py3-setuptools cython"
source="https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz
	"
builddir="$srcdir/$_pkgname-$pkgver"

replaces="py-pandas" # Backwards compatibility
provides="py-pandas=$pkgver-r$pkgrel" # Backwards compatibility

build() {
	python3 setup.py build
}

package() {
	python3 setup.py install --prefix=/usr --root="$pkgdir"
  python3 setup.py bdist_wheel
	cp -r ./dist/ "$pkgdir"
}
