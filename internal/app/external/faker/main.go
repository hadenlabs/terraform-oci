package faker

import (
	"reflect"

	fakerTag "github.com/bxcodec/faker/v3"
)

func Generator() {
	_ = fakerTag.AddProvider("UserUserNameFaker", func(v reflect.Value) (interface{}, error) {
		return User().UserName(), nil
	})
	_ = fakerTag.AddProvider("UserFullNameFaker", func(v reflect.Value) (interface{}, error) {
		return User().FullName(), nil
	})
	_ = fakerTag.AddProvider("UserPasswordFaker", func(v reflect.Value) (interface{}, error) {
		return User().Password(), nil
	})
	_ = fakerTag.AddProvider("UserEmailFaker", func(v reflect.Value) (interface{}, error) {
		return User().Email(), nil
	})
}
