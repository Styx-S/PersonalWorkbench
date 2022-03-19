package structure

type void struct{}

type Set struct {
	raw map[interface{}]void
}

func SetFactory() Set {
	return Set{raw: make(map[interface{}]void)}
}

func (set *Set) Add(i interface{}) {
	set.raw[i] = void{}
}

func (set *Set) Remove(i interface{}) {
	delete(set.raw, i)
}

func (set *Set) Contains(i interface{}) bool {
	_, ok := set.raw[i]
	return ok
}

func (set *Set) Elements() []interface{} {
	var arr = make([]interface{}, len(set.raw))

	set.VisitAll(func(i interface{}, idx int) {
		for key := range set.raw {
			arr[idx] = key
		}
	})

	return arr
}

func (set *Set) VisitAll(visitor func(i interface{}, idx int)) {
	i := 0
	for key := range set.raw {
		visitor(key, i)
		i++
	}
}
